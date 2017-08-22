require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  count = 0
  in_degree_count = Hash.new(0)
  queue = []
  res = []
  vertices.each do |vertex|
    if vertex.in_edges.length == 0
      queue << vertex
      next
    end
    length = vertex.in_edges.length
    in_degree_count[vertex] += length
  end
  until queue.empty?
    val = queue.pop
    res << val
    val.out_edges.each do |edge|
      in_degree_count[edge.to_vertex] -= 1
      if in_degree_count[edge.to_vertex] == 0
        queue.unshift(edge.to_vertex)
      end
    end
  end
  unless res.length == vertices.length
    return []
  end
  res
end
