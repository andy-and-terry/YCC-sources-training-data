def second_largest(values)
  values.uniq.sort.reverse[1]
end

p second_largest([5, 3, 9, 9, 1])
p second_largest([2, 2])
