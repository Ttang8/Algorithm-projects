class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.first

    left = array[1..-1].select { |int| int <= pivot}
    right = array[1..-1].select { |int| int > pivot}

    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |x,y| x <=> y }
    return array if length < 2
    pivot_idx = QuickSort.partition(array, start, length, &prc)
    # QuickSort.sort2!(array, pivot_idx + 1, length - pivot_idx - 1, &prc)
    # QuickSort.sort2!(array, start, pivot_idx, &prc)
    QuickSort.sort2!(array, start, pivot_idx - start, &prc)
    QuickSort.sort2!(array, pivot_idx+1, length - pivot_idx + start - 1, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|x,y| x <=> y }
    pivot, pivot_idx = array[start], start

    ((start+1)..(length+start-1)).each do |idx|
      if prc.call(pivot, array[idx]) == 1
        pivot_idx += 1
        new_pivot = array[idx]
        array[idx] = array[pivot_idx]
        array[pivot_idx] = new_pivot
      end
    end
    new_start = array[pivot_idx]
    array[pivot_idx] = array[start]
    array[start] = new_start
    pivot_idx
  end
end

p QuickSort.sort2!([4,3,5,10,6,2], 0)
