require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = Array.new(8)
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
    # answer
    # check_index(index)
    # store[(start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    if index >= @length
      raise "index out of bounds"
    else
      @store[index] = val
    end
    # answer
    # check_index(index)
    # store[(start_idx + index)] % capacity = val
  end

  # O(1)
  # looks same as dynamic array, same with push
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
    # answer
    # resize! if (length == capacity)
    # start_idx = (start_idx - 1) % capacity
    # length += 1
    # self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    if index == @capacity
      self.resize!
    end
    # answer
    # unless (index >= 0) && (index < length)
    #   raise "index out of bounds"
    # end
  end

  def resize!
    new_arr = Array.new(@capacity * 2)
    for i in 0...@capacity do
      new_arr[i] = @store[i]
    end
    @store = new_arr.dup
    @capacity = @capacity * 2
  end

# answer
#   new_capacity = capacity * 2
#   new_store = StaticArray.new(new_capacity)
#   length.times { |i| new_store[i] = self[i] }
#
#   @capacity = new_capacity
#   @store = new_store
#   @start_idx = 0
end

# when resize put values in correct order starting at start_idx
