def minutes_to_rot(input)
  grid = input.map(&:dup)
  frontier = []
  fresh = 0
  grid.each_with_index do |row, r|
    row.each_with_index do |v, c|
      frontier << [r, c] if v == 2
      fresh += 1 if v == 1
    end
  end
  minutes = 0
  while frontier.any? && fresh.positive?
    frontier = frontier.flat_map do |r, c|
      [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]].select do |nr, nc|
        next false unless nr.between?(0, grid.size - 1) && nc.between?(0, grid[nr].size - 1) && grid[nr][nc] == 1

        grid[nr][nc] = 2
        fresh -= 1
        true
      end
    end
    minutes += 1
  end
  fresh.zero? ? minutes : -1
end

p minutes_to_rot([[2, 1, 1], [1, 1, 0], [0, 1, 1]]), minutes_to_rot([[2, 1, 1], [0, 1, 1], [1, 0, 1]])
