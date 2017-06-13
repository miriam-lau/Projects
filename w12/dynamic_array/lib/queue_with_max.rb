# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new()
    @max_num = 0
  end

  def enqueue(val)
    @store.push(val)
    if val > @max_num
      @max_num = val
    end
  end

  def dequeue
    if @store.shift == @max_num
      new_max = @store[1]
      for i in 2...@store.length do
        if store[i] > new_max
          new_max = store[i]
        end
      end
      @max_num = new_max
    end
    @store.shift
  end

  def max
    @max_num
  end

  def length
    @store.length
  end

end
