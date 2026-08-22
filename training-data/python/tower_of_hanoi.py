def hanoi(n: int, source: str = "A", target: str = "C", auxiliary: str = "B", moves=None):
    if moves is None:
        moves = []
    if n == 1:
        moves.append((source, target))
        return moves
    hanoi(n - 1, source, auxiliary, target, moves)
    moves.append((source, target))
    hanoi(n - 1, auxiliary, target, source, moves)
    return moves


if __name__ == "__main__":
    for move in hanoi(3):
        print(move)
