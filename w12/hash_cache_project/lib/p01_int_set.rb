class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(@max, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    end
  end

  def include?(num)
    @store[num] == true ? true : false
  end

  private

  def is_valid?(num)
    if num > @max || num < 0
      raise "Out of bounds"
    end
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
    return false if include?(num)
    self[num] << num
    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
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
    return false if self.include?(num)
    self[num].push(num)
    @count += 1
    resize! if num_buckets < @count
    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_arr = @store.dup
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

    old_arr.flatten.each { |num| self.insert(num) }
  end
end
