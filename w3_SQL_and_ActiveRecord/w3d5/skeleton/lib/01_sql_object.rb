require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
# need to get columns from table and save it to a temp var
# need a return array
# loop over columns- is a hash (only first is needed to get all col
#   names) and for each key_value pair, only need the key
#   so push into ret array the key converted to a sym.
  def self.columns
    return @columns if @columns
    columns = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL
    ret = []
    columns.each { |key| ret << key.to_sym }
    @columns = ret
    @columns
  end

  def self.finalize!
  #calls the self.attribute method
    self.columns.each do |column|
      define_method(column) { self.attributes[column] }

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

#don't completely understand this
  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    all_records = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    self.parse_all(all_records)
  end

#both work, but map is better as it already returns
# a new array.
  def self.parse_all(results)
    results.map do |hash|
      self.new(hash)
    end

    # ret = []
    # results.each do |hash|
    #     ret <<self.new(hash)
    # end
    # ret
  end

  def self.find(id)
    obj_by_id = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL

    return nil if obj_by_id.empty?
#create all objects with parse_all, then grab the first object, why?
    self.parse_all(obj_by_id).first
  end

  def initialize(params = {})
    params.each_pair do |attr_name, value|
      attr_name_sym = attr_name.to_sym
      if self.class.columns.include?(attr_name_sym)
        send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    if @attributes.nil?
      @attributes = {}
    end
    @attributes
  end

  def attribute_values
    self.class.columns.map do |column|
      send(column)
    end
  end

  def insert
    arr = self.class.columns
    col_names = arr.join(", ")
    question_marks = (["?"] * arr.count).join(", ")

    DBConnection.execute(<<-SQL, *self.attribute_values)
      INSERT INTO
        #{self.class.table_name}(#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    ret = []
    self.class.columns.map do |attr_name|
      ret << "#{attr_name} = ?"
    end
    ret = ret.join(", ")

    DBConnection.execute(<<-SQL, *self.attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{ret}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    if self.class.find(id).nil?
      self.insert
    else
      self.update
    end
  end
end
