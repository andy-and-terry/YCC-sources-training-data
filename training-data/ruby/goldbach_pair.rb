# Goldbach pair for an even number.
require 'prime'
def goldbach(n)
  (2..n / 2).find { |p| p.prime? && (n - p).prime? }.then { |p| [p, n - p] }
end
p goldbach(28)
