#$cons_nums = []
=begin
class Numbers
  def initialize
    @cons_nums = []
  end
=end
require "byebug"
def range(start, last)
  return [] if last < start
  return [start] if start == last
  [start] + range(start + 1, last)
end
#end

def iteration_range(start, last)
  cons_nums = []
  (start..last).each { |num| cons_nums << num }
  cons_nums
end

def exp1(b, n)
  return 1 if n == 0
  b * exp1(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    res = exp2(b, n / 2)
    res * res
  else
    res = exp2(b, (n - 1) / 2)
    b * res * res
  end
end

class Array

  def deep_dup
    return nil unless self.is_a?(Array)
    return [] if self.length == 0
    container = []
    self.each do |el|
      if el.is_a?(Array)
      container <<  el.deep_dup
      else
        container << el
      end
    end
    container
      # [self[i][0]] + (self).deep_dup

  end
end

def fibonacci_it(n)
    return nil if n < 1
    return [1] if n == 1
    return [1,1] if n == 2
    fib = [1,1]
    (n - 2).times do
      fib << fib[-1] + fib [-2]
    end
    fib
end

def fib_rec(n)
  return [] if n < 1
  return [1] if n == 1
  return [1,1] if n == 2
  fib = fib_rec(n-1)
  fib << fib[-1] + fib[-2]
  fib
end


def subsets(arr)
  return [] if arr.empty?
  return [[], arr[-1]] if arr.length == 1
  (0...arr.length).each do |idx|
    res = [[], [arr[idx]]]
    res << subsets([res, arr[idx]])
  end
  res
end

def bsearch(arr, target)
  return nil unless arr.include?(target)
  middle_idx = arr.length / 2
  left_idx = 0
  right_idx = arr.length - 1

  return left_idx if left_idx == right_idx
  return middle_idx if arr[middle_idx] == target

  if arr[middle_idx] > target
    right_idx = middle_idx - 1
  else #arr[middle_idx] < target
    left_idx = middle_idx + 1
  end
  bsearch(arr[left_idx..right_idx], target)
end

def merge_sort(arr)
  return [] if arr.empty?
  return arr if arr.length == 1

end
