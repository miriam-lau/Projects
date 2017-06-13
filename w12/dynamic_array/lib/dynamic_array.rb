require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = Array.new()
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
    @store = @store[0...-1]
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length == @capacity
      self.resize!
    else
      @store[@length] = val
      @length += 1
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
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    if index == @capacity
      self.resize!
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @store.push(@capacity)
    @capacity = @capacity * 2
  end
end
