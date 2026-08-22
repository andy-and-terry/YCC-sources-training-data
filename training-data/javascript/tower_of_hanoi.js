function hanoi(n, source = 'A', target = 'C', auxiliary = 'B', moves = []) {
  if (n === 1) {
    moves.push([source, target]);
    return moves;
  }
  hanoi(n - 1, source, auxiliary, target, moves);
  moves.push([source, target]);
  hanoi(n - 1, auxiliary, target, source, moves);
  return moves;
}

console.log(hanoi(3));
module.exports = { hanoi };
