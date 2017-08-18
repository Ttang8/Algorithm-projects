class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |x, y| x <=> y }
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    val = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, count, &@prc)
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, count-1, count, &@prc)
  end

  public
  def self.child_indices(len, parent_index)
    [(parent_index * 2) + 1, (parent_index * 2) + 2].select { |child| child < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = prc || Proc.new { |x, y| x <=> y }
    swap = true
    current_parent = parent_idx
    while swap
      swap = false
      child_idx_arr = BinaryMinHeap.child_indices(len, current_parent)
      if child_idx_arr.length == 2
        if prc.call(array[child_idx_arr[0]], array[child_idx_arr[1]]) == 1
          child_idx_arr = child_idx_arr[1]
        else
          child_idx_arr = child_idx_arr[0]
        end
      else
        child_idx_arr = child_idx_arr[0]
      end
      [child_idx_arr].each do |idx|
        if idx != nil && prc.call(array[current_parent], array[idx]) == 1
          array[current_parent], array[idx] = array[idx], array[current_parent]
          current_parent = idx
          swap = true
        end
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc = prc || Proc.new { |x,y| x <=> y }
    swap = true
    current_child = child_idx
    return array if len == 1
    while swap
      swap = false
      parent_idx = BinaryMinHeap.parent_index(current_child)
      if prc.call(array[parent_idx], array[current_child]) == 1
        array[parent_idx], array[current_child] = array[current_child], array[parent_idx]
        current_child = parent_idx
        if current_child == 0
          swap = false
        else
          swap = true
        end
      end
    end
    array
  end
end
