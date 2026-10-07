MOVES = { 'D' => [1, 0], 'L' => [0, -1], 'R' => [0, 1], 'U' => [-1, 0] }.freeze

def solve_maze(maze)
  n = maze.size
  seen = Array.new(n) { Array.new(n, false) }
  paths = []
  walk = lambda do |r, c, path|
    return paths << path if r == n - 1 && c == n - 1

    seen[r][c] = true
    MOVES.each do |name, (dr, dc)|
      nr = r + dr
      nc = c + dc
      next unless nr.between?(0, n - 1) && nc.between?(0, n - 1) && maze[nr][nc] == 1 && !seen[nr][nc]

      walk.call(nr, nc, path + name)
    end
    seen[r][c] = false
  end
  walk.call(0, 0, '') if maze[0][0] == 1
  paths
end

p solve_maze([[1, 0, 0, 0], [1, 1, 0, 1], [1, 1, 0, 0], [0, 1, 1, 1]])
