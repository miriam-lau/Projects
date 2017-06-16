require_relative 'heap'

def k_largest_elements(array, k)
  arr = array.dup.sort
  start_idx = arr.length - k
  arr[start_idx..-1]
end
