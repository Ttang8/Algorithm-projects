require_relative 'heap'

def k_largest_elements(array, k)
  res = []
  heap = BinaryMinHeap.new { |x,y| y <=> x}
  array.each do |el|
    heap.push(el)
  end
  until heap.count == 0
    val = heap.extract
    res << val
  end
  res[0...k]
end
