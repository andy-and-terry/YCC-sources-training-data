def tower_of_hanoi(n, source = "A", auxiliary = "B", target = "C", moves = [])
  return moves if n.zero?

  tower_of_hanoi(n - 1, source, target, auxiliary, moves)
  moves << "move disk #{n} from #{source} to #{target}"
  tower_of_hanoi(n - 1, auxiliary, source, target, moves)
  moves
end

moves = tower_of_hanoi(3)
moves.each { |m| puts m }
puts "total moves: #{moves.size}"
