require 'set'

# A graph is bipartite iff it can be 2-colored so that no edge joins
# two nodes of the same color. BFS assigns alternating colors and
# fails as soon as an edge would force two neighbors to share one.
def bipartite?(graph)
  colors = {}

  graph.each_key do |start|
    next if colors.key?(start)

    colors[start] = 0
    queue = [start]

    until queue.empty?
      node = queue.shift
      graph[node].each do |neighbor|
        if colors.key?(neighbor)
          return false if colors[neighbor] == colors[node]
        else
          colors[neighbor] = 1 - colors[node]
          queue << neighbor
        end
      end
    end
  end

  true
end

even_cycle = { 0 => [1, 3], 1 => [0, 2], 2 => [1, 3], 3 => [2, 0] }
odd_cycle = { 0 => [1, 2], 1 => [0, 2], 2 => [0, 1] }

puts bipartite?(even_cycle) # true
puts bipartite?(odd_cycle)  # false
