class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    partition_idx = start

    ((start + 1)...(start + length)).each do |i|
      if prc.call(array[i], array[start]) == -1
        array[i], array[partition_idx + 1] = array[partition_idx + 1], array[i]
        partition_idx += 1
      end
    end

    array[start], array[partition_idx] = array[partition_idx], array[start]
    partition_idx
  end

  def self.sort1(array)
    partition_idx = QuickSort.partition(array, 0, array.length)
    array[0], array[partition_idx] = array[partition_idx], array[0]

    left = array[0...partition_idx]
    right = array[partition_idx + 1..-1]

    QuickSort(array, 0, left.length) + [array[partition_idx]] +
      QuickSort(array, partition_idx + 1, right.length)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length < 2

    prc ||= Proc.new { |a, b| a <=> b }
    partition_idx = QuickSort.partition(array, start, length, &prc)

    QuickSort.sort2!(array, start, partition_idx - start, &prc)
    QuickSort.sort2!(array, start + partition_idx + 1, length - partition_idx - 1, &prc)
  end

end
