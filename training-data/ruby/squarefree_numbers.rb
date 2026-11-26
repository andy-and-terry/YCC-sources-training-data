# Squarefree numbers up to 100; expect 61.
def squarefree?(n)
  (2..Integer.sqrt(n)).none? { |d| (n % (d * d)).zero? }
end

puts (1..100).count { |n| squarefree?(n) }
