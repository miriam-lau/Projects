require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num < 0 || num > @store.length
    true
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    mod_20 = num % 20
    @store[mod_20] << num
  end

  def remove(num)
    mod_20 = num % 20
    @store[mod_20].delete(num) if @store[mod_20].include?(num)
  end

  def include?(num)
    mod_20 = num % 20
    @store[mod_20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    mod = num % num_buckets
    @count += 1
    @store[mod] << num
    resize! if @count >= num_buckets
  end

  def remove(num)
    mod = num % num_buckets
    @store[mod].delete(num) if @store[mod].include?(num)
  end

  def include?(num)
    mod = num % num_buckets
    @store[mod].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    new_mod = new_store.length
    # debugger
    @store.each do |bucket|
      bucket.each do |el|
        bucket_idx = el % new_mod
        new_store[bucket_idx] << el
      end
    end
    @store = new_store
  end
end
