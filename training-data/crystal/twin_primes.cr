# Twin primes below 50.
def prime?(n : Int32) : Bool
  n > 1 && (2..Math.sqrt(n).to_i).none? { |d| n % d == 0 }
end

p (2..50).select { |x| prime?(x) && prime?(x + 2) }.map { |x| {x, x + 2} }
