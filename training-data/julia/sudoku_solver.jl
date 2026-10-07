function is_valid(board::Matrix{Int}, row::Int, col::Int, num::Int)
    for i in 1:9
        if board[row, i] == num || board[i, col] == num
            return false
        end
    end
    box_row, box_col = 3 * div(row - 1, 3), 3 * div(col - 1, 3)
    for i in 1:3, j in 1:3
        if board[box_row + i, box_col + j] == num
            return false
        end
    end
    return true
end

function solve!(board::Matrix{Int})
    for row in 1:9, col in 1:9
        if board[row, col] == 0
            for num in 1:9
                if is_valid(board, row, col, num)
                    board[row, col] = num
                    if solve!(board)
                        return true
                    end
                    board[row, col] = 0
                end
            end
            return false
        end
    end
    return true
end

board = [
    5 3 0 0 7 0 0 0 0;
    6 0 0 1 9 5 0 0 0;
    0 9 8 0 0 0 0 6 0;
    8 0 0 0 6 0 0 0 3;
    4 0 0 8 0 3 0 0 1;
    7 0 0 0 2 0 0 0 6;
    0 6 0 0 0 0 2 8 0;
    0 0 0 4 1 9 0 0 5;
    0 0 0 0 8 0 0 7 9
]

if solve!(board)
    for row in 1:9
        println(board[row, :])
    end
else
    println("no solution")
end
