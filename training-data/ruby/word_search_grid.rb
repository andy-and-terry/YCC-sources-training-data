def exist?(board, word)
  rows = board.size
  cols = board[0].size
  dfs = lambda do |r, c, i|
    return true if i == word.size
    return false unless r.between?(0, rows - 1) && c.between?(0, cols - 1) && board[r][c] == word[i]

    saved = board[r][c]
    board[r][c] = '#'
    found = [[1, 0], [-1, 0], [0, 1], [0, -1]].any? { |dr, dc| dfs.call(r + dr, c + dc, i + 1) }
    board[r][c] = saved
    found
  end
  (0...rows).any? { |r| (0...cols).any? { |c| dfs.call(r, c, 0) } }
end

board = %w[ABCE SFCS ADEE].map(&:chars)
%w[ABCCED SEE ABCB].each { |w| puts "#{w} #{exist?(board, w)}" }
