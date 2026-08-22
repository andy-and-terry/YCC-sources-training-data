def valid_placement?(board, row, col, num)
  return false if board[row].include?(num)
  return false if board.map { |r| r[col] }.include?(num)
  box_row, box_col = 3 * (row / 3), 3 * (col / 3)
  (box_row...box_row + 3).each do |r|
    (box_col...box_col + 3).each { |c| return false if board[r][c] == num }
  end
  true
end

def solve(board)
  (0...9).each do |row|
    (0...9).each do |col|
      next unless board[row][col].zero?

      (1..9).each do |num|
        next unless valid_placement?(board, row, col, num)

        board[row][col] = num
        return true if solve(board)

        board[row][col] = 0
      end
      return false
    end
  end
  true
end

board = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9]
]
solve(board)
board.each { |row| puts row.inspect }
