def cocktail_shaker_sort(items)
  a = items.dup
  lo = 0
  hi = a.size - 1
  swapped = true
  while swapped
    swapped = false
    (lo...hi).each do |i|
      next unless a[i] > a[i + 1]
      a[i], a[i + 1] = a[i + 1], a[i]
      swapped = true
    end
    hi -= 1
    hi.downto(lo + 1) do |i|
      next unless a[i - 1] > a[i]
      a[i - 1], a[i] = a[i], a[i - 1]
      swapped = true
    end
    lo += 1
  end
  a
end

p cocktail_shaker_sort([5, 1, 4, 2, 8, 0, 2])
p cocktail_shaker_sort(%w[pear apple fig])
