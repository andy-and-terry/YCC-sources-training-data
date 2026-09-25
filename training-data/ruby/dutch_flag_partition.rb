ORDER = { red: 0, white: 1, blue: 2 }.freeze

def dutch_flag!(a)
  lo = mid = 0
  hi = a.size - 1
  while mid <= hi
    case ORDER.fetch(a[mid])
    when 0
      a[lo], a[mid] = a[mid], a[lo]
      lo += 1
      mid += 1
    when 1
      mid += 1
    else
      a[mid], a[hi] = a[hi], a[mid]
      hi -= 1
    end
  end
  a
end

p dutch_flag!(%i[blue red white blue red white red])
# Enumerable#partition-based alternative (not in place, but stable)
p %i[blue red white blue red].group_by { |c| ORDER[c] }.sort.flat_map(&:last)
