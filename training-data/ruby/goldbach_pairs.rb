require 'prime'

def goldbach(n)
  (2..n / 2).select { |p| p.prime? && (n - p).prime? }.map { |p| [p, n - p] }
end

p goldbach(28)
