def binary_search(items, target)
  low, high = 0, items.length - 1
  while low <= high
    mid = (low + high) / 2
    return mid if items[mid] == target
    items[mid] < target ? low = mid + 1 : high = mid - 1
  end
  -1
end

puts binary_search([1, 2, 5, 7, 9, 11], 7)
