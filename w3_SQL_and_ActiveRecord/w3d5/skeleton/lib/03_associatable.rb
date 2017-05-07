require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

#not clear on this one
# should call `Human::table_name`
# options.table_name # => "humans"
  def table_name
    self.model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    default = {
      foreign_key: "#{name}_id".to_sym,
      primary_key: :id,
      class_name: name.to_s.camelcase(:upper)
    }

    default.keys.each do |key|
      if options.has_key?(key)
        self.send("#{key}=", options[key])
      else
        self.send("#{key}=", default[key])
      end
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    default = {
      foreign_key: "#{self_class_name.underscore}_id".to_sym,
      primary_key: :id,
      class_name: name.singularize.camelcase(:upper)
    }

    default.keys.each do |key|
      if options.has_key?(key)
        self.send("#{key}=", options[key])
      else
        self.send("#{key}=", default[key])
      end
    end
  end
end

module Associatable
  # Phase IIIb
# NoMethodError:
#        undefined method `belongs_to' for Cat:Class
# #error due to not extending module in SQLObject class;
# #error fixed by adding "extend Associatable" to line 84

  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      foreign_key_val = self.send(options.foreign_key)
      options.model_class.where(options.primary_key => foreign_key_val).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, name.model_name, options)
    define_method(name) do
      foreign_key_val = self.send(options.foreign_key)
      options.model_class.where(options.primary_key => foreign_key_val).first
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
