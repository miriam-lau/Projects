## 500 files

# You are given 500 files, each containing the stock trading data for a
# company. Within each file all the trades have timestamps.
# The timestamps appear in ascending order. Your job is to create one
# file of all data in ascending time order. Achieve the best Time and
# Space complexity that you can, and don't modify the inputs.

# naive solution: add all the files together, and sort.
# looking for min heap

# [1, 2, 7]
# [3, 6]
# [4, 5]

# take 1, then check all three again
# [2, 7]
# [3, 6]
# [4, 5]

# - naive solution: concat all arrays and sort: O(nlog(n))
# - all inputs are already sorted: this means that the next element we want
# to add to our output is always among the first elements of the inputs.
# - min heap consisting of the first elements will let us always extract the
# minimum element in log(k) time, where k is the number of input files.
# - key subproblem: how to keep track of which file the extracted element
# originated from so that we can push the next element from that file onto
# our heap

require_relative "heap"

# loop is O(n^2)
# sort is O(nlogn)
# final runtime is O(n^2)

def five_hundred_files(arr_of_arrs)
  result = []
  arr_of_arrs.each do |i|
    result += arr[i]
  end
  result.sort!
end


def five_hundred_files(arr_of_arrs)
  result = BinaryMinHeap.new
  arr_of_arrs.each do |i|
    heap = BinaryMinHeap.new
      file.each do |trade|
        heap.push(trade)
      end
    heap
  end
end

## 500 files

```ruby
require_relative "heap"

answer
def five_hundred_files(arr_of_arrs)
    # We will need to store info about where the element came from,
    # so we need to pass a proc that will compare the first item (the value)
    # from an entry containing relevant information
    prc = Proc.new { |el1, el2| el1[0] <=> el2[0] }
    heap = BinaryMinHeap.new(&prc)
    result = []
    
    # Populate with first elements
    arr_of_arrs.length.times do |i|
        # Relevant info: [value, origin array number, origin index]
        heap.push([arr_of_arrs[i][0], i, 0])
    end
    
    # Extract the minimum element and use the meta-data to select the
    # next element to push onto the heap
    while  heap.count > 0
        min = heap.extract
        result << min[0]
        
        next_arr_i = min[1]
        next_idx = min[2] + 1
        next_el = arr_of_arrs[next_arr_i][next_idx]
        
        heap.push([next_el, next_arr_i, next_idx]) if next_el
    end
    result
end


arr_of_arrs = [[3,5,7], [0,6], [0,6,28]]

p five_hundred_files(arr_of_arrs)
```
