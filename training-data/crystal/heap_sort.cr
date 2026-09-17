def heapify(arr : Array(Int32), n : Int32, i : Int32)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  largest = left if left < n && arr[left] > arr[largest]
  largest = right if right < n && arr[right] > arr[largest]

  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    heapify(arr, n, largest)
  end
end

def heap_sort(arr : Array(Int32)) : Array(Int32)
  a = arr.dup
  n = a.size

  (n // 2 - 1).downto(0) { |i| heapify(a, n, i) }

  (n - 1).downto(1) do |i|
    a[0], a[i] = a[i], a[0]
    heapify(a, i, 0)
  end

  a
end

puts heap_sort([5, 3, 8, 1, 9, 2]).inspect
