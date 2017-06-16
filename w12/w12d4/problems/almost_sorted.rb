## Almost sorted

# Timestamped data may not always make it into the database in the
# perfect order. Server loads, network routes, etc. Your job is to
# take in a very long sequence of numbers in real-time and efficiently
# print it out in the correct order. Each number is, at most, `k` away
# from its final sorted position. Target time complexity is `O(nlogk)`
# and target space is `O(k)`.

require_relative 'heap'

# runtime O(nlogn)
def almost_sorted(arr, k)
  result = arr.sort
  result
end

# - make a heap of k elements, once reach k length, any new addition will
# remove one from the k heap and add to result.


answer
## Almost sorted
```ruby
require_relative 'heap'

def almost_sorted(arr, k)
    heap = BinaryMinHeap.new
    # If k = 2, the first output element must be
    # within the first 3 numbers, so we build a heap of 3
    (k + 1).times do
        heap.push(arr.shift)
    end
    
    # Accounts for when the array runs out but we still have
    # numbers in our heap
    while heap.count > 0
        print heap.extract
        heap.push(arr.shift) if arr[0]
    end
end

arr = [3, -1, 2, 6, 4, 5, 8]
almost_sorted(arr, 2)
