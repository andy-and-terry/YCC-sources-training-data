# Sorts using a block as the comparison, like Array#sort.
def gnome_sort(items, &cmp)
  cmp ||= ->(x, y) { x <=> y }
  a = items.dup
  i = 0
  while i < a.size
    if i.zero? || cmp.call(a[i - 1], a[i]) <= 0
      i += 1
    else
      a[i - 1], a[i] = a[i], a[i - 1]
      i -= 1
    end
  end
  a
end

p gnome_sort([34, 2, 10, -9, 7])
p gnome_sort(%w[Delta alpha Charlie bravo]) { |x, y| x.downcase <=> y.downcase }
p gnome_sort([3, 1, 2]) { |x, y| y <=> x }
