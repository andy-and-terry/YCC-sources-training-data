require "set"

def heuristic(a, b)
  (a[0] - b[0]).abs + (a[1] - b[1]).abs
end

def a_star(grid, start, goal)
  rows, cols = grid.size, grid[0].size
  open_set = { start => heuristic(start, goal) }
  came_from = {}
  g_score = Hash.new(Float::INFINITY)
  g_score[start] = 0

  until open_set.empty?
    current = open_set.min_by { |_, f| f }.first
    return reconstruct(came_from, current) if current == goal

    open_set.delete(current)
    r, c = current

    [[r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]].each do |neighbor|
      nr, nc = neighbor
      next unless nr.between?(0, rows - 1) && nc.between?(0, cols - 1)
      next if grid[nr][nc] == 1

      tentative = g_score[current] + 1
      if tentative < g_score[neighbor]
        came_from[neighbor] = current
        g_score[neighbor] = tentative
        open_set[neighbor] = tentative + heuristic(neighbor, goal)
      end
    end
  end
  nil
end

def reconstruct(came_from, current)
  path = [current]
  path.unshift(current = came_from[current]) while came_from.key?(current)
  path
end

grid = [
  [0, 0, 0, 0],
  [1, 1, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 1, 0],
]

path = a_star(grid, [0, 0], [3, 3])
puts path.inspect
