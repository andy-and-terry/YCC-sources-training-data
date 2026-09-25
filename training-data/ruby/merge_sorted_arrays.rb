def merge_two(a, b)
  out = []
  i = j = 0
  while i < a.size && j < b.size
    if a[i] <= b[j]
      out << a[i]
      i += 1
    else
      out << b[j]
      j += 1
    end
  end
  out.concat(a[i..], b[j..])
end

# Divide and conquer: merge pairs until one list remains.
def merge_k(lists)
  return [] if lists.empty?

  lists = lists.each_slice(2).map { |x, y| y ? merge_two(x, y) : x } while lists.size > 1
  lists.first
end

p merge_two([1, 4, 7], [2, 3, 8, 9])
p merge_k([[1, 5, 9], [2, 6], [], [0, 3, 4, 10]])
