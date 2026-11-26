# Squarefree numbers up to 100; expect 61.
def squarefree?(n : Int32) : Bool
  d = 2
  while d * d <= n
    return false if n % (d * d) == 0
    d += 1
  end
  true
end

puts (1..100).count { |n| squarefree?(n) }
