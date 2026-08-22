def solve_n_queens(n: int):
    solutions = []
    columns = set()
    diagonals = set()
    anti_diagonals = set()
    board = [-1] * n

    def backtrack(row):
        if row == n:
            solutions.append(board[:])
            return
        for col in range(n):
            if col in columns or (row - col) in diagonals or (row + col) in anti_diagonals:
                continue
            columns.add(col)
            diagonals.add(row - col)
            anti_diagonals.add(row + col)
            board[row] = col
            backtrack(row + 1)
            columns.remove(col)
            diagonals.remove(row - col)
            anti_diagonals.remove(row + col)

    backtrack(0)
    return solutions


if __name__ == "__main__":
    print(len(solve_n_queens(6)))
