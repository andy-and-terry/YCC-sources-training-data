# Tower of Hanoi solved recursively, collecting moves as tuples.

def hanoi(n : Int32, from : Char, to : Char, via : Char, moves : Array({Char, Char})) : Nil
  return if n == 0
  hanoi(n - 1, from, via, to, moves)
  moves << {from, to}
  hanoi(n - 1, via, to, from, moves)
end

moves = [] of {Char, Char}
hanoi(3, 'A', 'C', 'B', moves)

moves.each_with_index(1) do |(from, to), i|
  puts "Move #{i}: #{from} -> #{to}"
end

puts "Total moves: #{moves.size} (expected #{2**3 - 1})"
