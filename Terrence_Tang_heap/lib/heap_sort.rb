require_relative "heap"

class Array
  def heap_sort!
    heap = BinaryMinHeap.new
    res = []
    self.each do |el|
      heap.push(el)
    end
    until heap.count == 0
      val = heap.extract
      res << val
    end
    res.each_with_index do |el, idx|
      self[idx] = el
    end
    self
  end
end
