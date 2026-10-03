local function is_valid(board, row, col, num)
  for i = 1, 9 do
    if board[row][i] == num or board[i][col] == num then return false end
  end
  local box_row = math.floor((row - 1) / 3) * 3
  local box_col = math.floor((col - 1) / 3) * 3
  for i = 1, 3 do
    for j = 1, 3 do
      if board[box_row + i][box_col + j] == num then return false end
    end
  end
  return true
end

local function solve(board)
  for row = 1, 9 do
    for col = 1, 9 do
      if board[row][col] == 0 then
        for num = 1, 9 do
          if is_valid(board, row, col, num) then
            board[row][col] = num
            if solve(board) then return true end
            board[row][col] = 0
          end
        end
        return false
      end
    end
  end
  return true
end

local board = {
  { 5, 3, 0, 0, 7, 0, 0, 0, 0 },
  { 6, 0, 0, 1, 9, 5, 0, 0, 0 },
  { 0, 9, 8, 0, 0, 0, 0, 6, 0 },
  { 8, 0, 0, 0, 6, 0, 0, 0, 3 },
  { 4, 0, 0, 8, 0, 3, 0, 0, 1 },
  { 7, 0, 0, 0, 2, 0, 0, 0, 6 },
  { 0, 6, 0, 0, 0, 0, 2, 8, 0 },
  { 0, 0, 0, 4, 1, 9, 0, 0, 5 },
  { 0, 0, 0, 0, 8, 0, 0, 7, 9 },
}

if solve(board) then
  for i = 1, 9 do
    print(table.concat(board[i], " "))
  end
else
  print("no solution")
end
