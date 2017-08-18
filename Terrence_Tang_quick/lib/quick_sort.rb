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
    return array if array.length <= 1
    pivot = start
  end

  def self.partition(array, start, length, &prc)

  end
end
