# Goldbach partitions of 100; expect 6.
def prime?(n)
  n > 1 && (2..Integer.sqrt(n)).none? { |d| (n % d).zero? }
end

pairs = (2..50).select { |p| prime?(p) && prime?(100 - p) }.map { |p| [p, 100 - p] }
p pairs
puts pairs.length
