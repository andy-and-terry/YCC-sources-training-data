def perfect_square?(n : Int32) : Bool
  return false if n < 0
  r = Math.sqrt(n).to_i
  r * r == n
end

p (0...30).select { |n| perfect_square?(n) }
