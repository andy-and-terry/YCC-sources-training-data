def hanoi(n : Int32, a : Char, b : Char, c : Char, out : Array(String))
  return if n == 0
  hanoi(n - 1, a, c, b, out)
  out << "#{a}->#{c}"
  hanoi(n - 1, b, a, c, out)
end

moves = [] of String
hanoi(3, 'A', 'B', 'C', moves)
puts "#{moves.size}: #{moves.join(" ")}"
