def rob(houses)
  houses.reduce([0, 0]) { |(take, skip), h| [skip + h, [take, skip].max] }.max
end

def rob_circle(houses)
  return houses.first if houses.size == 1

  [rob(houses[1..]), rob(houses[...-1])].max
end

p rob([2, 7, 9, 3, 1]), rob_circle([2, 3, 2]), rob_circle([1, 2, 3, 1])
