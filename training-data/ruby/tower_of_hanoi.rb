def hanoi(n, from, to, via, moves = [])
  return moves if n.zero?

  hanoi(n - 1, from, via, to, moves)
  moves << "move disk #{n} from #{from} to #{to}"
  hanoi(n - 1, via, to, from, moves)
  moves
end

hanoi(3, 'A', 'C', 'B').each { |move| puts move }
