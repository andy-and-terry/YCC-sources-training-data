def merge_sort(items)
  return items if items.length <= 1

  mid = items.length / 2
  left = merge_sort(items[0...mid])
  right = merge_sort(items[mid..])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

puts merge_sort([5, 3, 8, 1, 9, 2]).inspect
