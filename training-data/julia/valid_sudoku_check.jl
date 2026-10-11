function valid_sudoku(board::Matrix{Char})
    seen = Set{Tuple{Symbol,Int,Int,Char}}()
    for r in 1:9, c in 1:9
        v = board[r, c]
        v == '.' && continue
        keys = ((:row, r, 0, v), (:col, c, 0, v), (:box, (r - 1) ÷ 3, (c - 1) ÷ 3, v))
        any(k -> k in seen, keys) && return false
        union!(seen, keys)
    end
    return true
end

board = fill('.', 9, 9)
board[1, 1] = '5'
board[2, 2] = '5'
println(valid_sudoku(board))
board[2, 2] = '6'
println(valid_sudoku(board))
