class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    @store.length - 1
  end

  def extract
    raise "heap is empty" if count == 0
    @store.sort!
    val = @store[0]

    if count > 1
      @store[0] = @store.pop
      BinaryMinHeap.heapify_down(@store, 0, &@prc)
    else
      @store.pop
    end
    val
  end

  def peek
    raise "heap is empty" if count == 0
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count - 1, &@prc)
  end

  public
  def self.child_indices(len, parent_index)
    children = []
    idx1 = (2 * parent_index) + 1
    idx2 = (2 * parent_index) + 2

    children.push(idx1) if idx1 < len
    children.push(idx2) if idx2 < len
    children
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    children = self.child_indices(len, parent_idx)

    if children.all? { |idx| prc.call(array[parent_idx], array[idx]) <= 0 }
      return array
    end

    if children.length == 1
      swap_idx = children.first
    else
      child_values = [array[children[0]], array[children[1]]]
      swap_idx = prc.call(child_values[0], child_values[1]) == -1 ?
        children[0] : children[1]
    end

    array[parent_idx], array[swap_idx] = array[swap_idx], array[parent_idx]
    self.heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if child_idx == 0

    p_idx = self.parent_index(child_idx)

    if prc.call(array[p_idx], array[child_idx]) > 0
      array[p_idx], array[child_idx] = array[child_idx], array[p_idx]
      self.heapify_up(array, p_idx, len, &prc)
    else
      return array
    end
  end
end
