def exponential_search(a, target)
  return nil if a.empty?

  bound = 1
  bound *= 2 while bound < a.size && a[bound] < target
  lo = bound / 2
  hi = [bound, a.size - 1].min
  idx = (lo..hi).bsearch { |i| a[i] >= target }
  idx if idx && a[idx] == target
end

data = (0...67).map { |i| i * 3 }
p [exponential_search(data, 99), exponential_search(data, 100), exponential_search(data, 0)]
