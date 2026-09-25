def fibonacci_search(a, target)
  n = a.size
  f2 = 0
  f1 = 1
  f = 1
  f2, f1, f = f1, f, f + f1 while f < n
  offset = -1
  while f > 1
    i = [offset + f2, n - 1].min
    if a[i] < target
      f = f1
      f1 = f2
      f2 = f - f1
      offset = i
    elsif a[i] > target
      f = f2
      f1 -= f2
      f2 = f - f1
    else
      return i
    end
  end
  f1 == 1 && offset + 1 < n && a[offset + 1] == target ? offset + 1 : nil
end

a = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100]
[85, 10, 100, 7].each { |t| puts "#{t} -> #{fibonacci_search(a, t).inspect}" }
