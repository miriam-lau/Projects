require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    mod = key.hash % num_buckets
    @store[mod].include?(key)
  end

  def set(key, val)
    mod = key.hash % num_buckets
    if @store[mod].include?(key)
      @store[mod].update(key, val)
    else
      @store[mod].append(key,val)
      @count += 1
    end
    resize! if @count >= num_buckets
  end

  def get(key)
    mod = key.hash % num_buckets
    @store[mod].get(key)
  end

  def delete(key)
    mod = key.hash % num_buckets
    if @store[mod].include?(key)
      @store[mod].remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |link|
      yield(link)
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { LinkedList.new }
    new_mod = new_store.length
    # debugger
    @store.each do |bucket|
      bucket.each do |el|
        bucket_idx = el.hash % new_mod
        new_store[bucket_idx].append(el.key, el.val)
      end
    end
    @store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
