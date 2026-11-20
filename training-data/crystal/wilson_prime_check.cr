# Wilson's theorem primality test.
def wilson?(n : Int32) : Bool
  return false if n < 2
  (2...n).reduce(1_i64) { |f, i| f * i % n } == n - 1
end

p (2..19).select { |n| wilson?(n) }
