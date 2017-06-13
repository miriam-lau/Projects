require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = Array.new()
    @length = 0
    @capacity = 8
    @start_idx = 0
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
  def []=(index, val)
    if index >= @length
      raise "index out of bounds"
    else
      @store[index] = val
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

  # O(1) ammortized
  def push(val)
    if @length == @capacity
      self.resize!
    else
      @store[@length] = val
      @length += 1
    end
  end

  # O(1)
  def shift
    if @length == 0
      raise "index out of bounds"
    end
    @length -= 1
    @start_idx += 1
    @store = @store[@start_idx...@store.length]
  end

  # O(1) ammortized
  def unshift(val)
    if @length == @capacity
      self.resize!
    end
    @length += 1
    @start_idx -= 1
    if @start_idx < 0
      @store[@capacity - @start_idx] = val
    else
      @store[@start_idx] = val
    end
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    if index == @capacity
      self.resize!
    end
  end

  def resize!
    new_arr = Array.new(@capacity * 2)
    for i in 0...@capacity do
      new_arr[i] = @store[i]
    end
    @store = new_arr.dup
    @capacity = @capacity * 2
  end
end
