require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  in_counts = {}
    queue = []

  vertices.each do |vertex|
    in_counts[vertex] = vertex.in_edges.count
    if vertex.in_edges.empty?
      queue << vertex
    end
  end

  sorted = []

  until queue.empty?
    vertex = queue.shift
    sorted << vertex

    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex

      in_counts[to_vertex] -= 1
      if in_counts[to_vertex] == 0
        queue << to_vertex
      end
    end
  end

  sorted
end
