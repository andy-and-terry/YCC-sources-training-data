# Goldbach pair returning a nilable tuple.
def prime?(n : Int32) : Bool
  n > 1 && (2..Math.sqrt(n).to_i).none? { |d| n % d == 0 }
end

def goldbach(n : Int32) : Tuple(Int32, Int32)?
  (2..n // 2).each { |p| return {p, n - p} if prime?(p) && prime?(n - p) }
  nil
end

p goldbach(28)
