# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  pakages = []
  ans = []
  arr.each do |set|
    pakages << set[0]
  end

  vertices = (1..pakages.max).map do |int|
    Vertex.new(int)
  end

  arr.each do |set|
    from_vertex = set[1] - 1
    to_vertex = set[0] - 1
    Edge.new(vertices[from_vertex], vertices[to_vertex])
  end

  res = topological_sort(vertices)
  res.each do |el|
    ans << el.value
  end
  ans
end
