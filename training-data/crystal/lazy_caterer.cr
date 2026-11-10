def pieces(cuts : Int32) : Int32
  (cuts * cuts + cuts + 2) // 2
end

puts (0...10).map { |n| pieces(n) }.join(" ") # 1 2 4 7 11 16 22 29 37 46
