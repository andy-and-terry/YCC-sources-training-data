def comb_sort(items)
  a = items.dup
  gap = a.size
  sorted = false
  until sorted
    gap = (gap / 1.3).to_i
    if gap <= 1
      gap = 1
      sorted = true
    end
    (0...(a.size - gap)).each do |i|
      next unless a[i] > a[i + gap]
      a[i], a[i + gap] = a[i + gap], a[i]
      sorted = false
    end
  end
  a
end

p comb_sort([8, 4, 1, 56, 3, -44, 23, -6, 28, 0])
