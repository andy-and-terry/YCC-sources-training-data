def heap_sort(arr)
  arr = arr.dup
  n = arr.length

  (n / 2 - 1).downto(0) { |i| sift_down(arr, n, i) }

  (n - 1).downto(1) do |end_index|
    arr[0], arr[end_index] = arr[end_index], arr[0]
    sift_down(arr, end_index, 0)
  end

  arr
end

def sift_down(arr, size, root)
  loop do
    largest = root
    left = 2 * root + 1
    right = 2 * root + 2

    largest = left if left < size && arr[left] > arr[largest]
    largest = right if right < size && arr[right] > arr[largest]
    break if largest == root

    arr[root], arr[largest] = arr[largest], arr[root]
    root = largest
  end
end

puts heap_sort([5, 2, 9, 1, 5, 6, -3]).inspect
