require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    mod = key.hash % num_buckets
    @count += 1
    @store[mod] << key
    resize! if @count >= num_buckets
  end

  def include?(key)
    mod = key.hash % num_buckets
    @store[mod].include?(key)
  end

  def remove(key)
    mod = key.hash % num_buckets
    @store[mod].delete(key) if @store[mod].include?(key)
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
        bucket_idx = el.hash % new_mod
        new_store[bucket_idx] << el
      end
    end
    @store = new_store
  end
end
