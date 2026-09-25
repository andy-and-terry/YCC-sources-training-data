def ways(n, steps = [1, 2])
  memo = { 0 => 1 }
  count = ->(k) { k.negative? ? 0 : memo[k] ||= steps.sum { |s| count.(k - s) } }
  count.(n)
end

def min_cost(cost) = cost.reduce([0, 0]) { |(a, b), c| [b, [a, b].min + c] }.min

p (1..10).map { |n| ways(n) }
puts ways(300), ways(10, [1, 3, 5])
puts min_cost([1, 100, 1, 1, 1, 100, 1, 1, 100, 1])
