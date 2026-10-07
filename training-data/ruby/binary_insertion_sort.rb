def binary_insertion_sort(items)
  items.each_with_object([]) do |x, out|
    idx = out.bsearch_index { |y| y > x } || out.size
    out.insert(idx, x)
  end
end

p binary_insertion_sort([37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54])
