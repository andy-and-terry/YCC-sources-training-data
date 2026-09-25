def jump_search(a, target)
  n = a.size
  step = [Math.sqrt(n).floor, 1].max
  prev = 0
  prev += step while prev < n && a[[prev + step, n].min - 1] < target
  (prev...[prev + step, n].min).find { |i| a[i] == target }
end

fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
p [jump_search(fib, 55), jump_search(fib, 4)]
