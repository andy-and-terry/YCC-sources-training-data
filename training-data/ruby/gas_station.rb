def start_station(gas, cost)
  diffs = gas.zip(cost).map { |g, c| g - c }
  return nil if diffs.sum.negative?

  tank = 0
  start = 0
  diffs.each_with_index do |d, i|
    tank += d
    next unless tank.negative?

    start = i + 1
    tank = 0
  end
  start
end

p start_station([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]), start_station([2, 3, 4], [3, 4, 3])
