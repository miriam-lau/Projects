require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    if @length != 0 && index < @length
      @store[index]
    elsif index == @capacity
      self.resize!
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def []=(index, value)
    if index >= @length
      raise "index out of bounds"
    else
      @store[index] = value
    end
  end

  # O(1)
  def pop
    if @length == 0
      raise "index out of bounds"
    end
    val, self[length - 1] = self[length - 1], nil
    # @store = @store[0...-1]
    @length -= 1
    val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length == @capacity
      self.resize!
    else
      @length += 1
      #increment length first, so won't get out of bounds error
      @store[@length - 1] = val

      # @store[@length] = val
      # @length += 1
    end
  end

  # O(n): has to shift over all the elements.
  def shift
    if @length == 0
      raise "index out of bounds"
    end

    new_arr = Array.new(@length - 1)
    for i in 0...(@length - 1) do
      new_arr[i] = @store[i + 1]
    end
    @store = new_arr.dup
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    new_arr = Array.new(@length + 1)
    new_arr[0] = val
    for i in 0...@length do
      new_arr[i + 1] = @store[i]
    end
    @store = new_arr.dup
    @length += 1

    # @length += 1
    # (length - 2).downto(0).each { |i| self[i + 1] = self...}
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

# helper method for raise error
  def check_index(index)
    if index == @capacity
      self.resize!
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_arr = Array.new(@capacity * 2)
    for i in 0...@capacity do
      new_arr[i] = @store[i]
    end
    @store = new_arr.dup
    @capacity = @capacity * 2

    # length.times { |i| new_store[i] = self[i] }
  end
end
