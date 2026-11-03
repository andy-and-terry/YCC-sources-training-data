def modes(items)
  counts = items.tally
  top = counts.values.max
  counts.select { |_, c| c == top }.keys.sort
end

p modes([1, 2, 2, 3, 3, 4])
