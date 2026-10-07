MIN_RUN = 32

def insertion_sort!(a, lo, hi)
  ((lo + 1)..hi).each do |i|
    key = a[i]
    j = i - 1
    while j >= lo && a[j] > key
      a[j + 1] = a[j]
      j -= 1
    end
    a[j + 1] = key
  end
end

def merge!(a, lo, mid, hi)
  left = a[lo..mid]
  right = a[(mid + 1)..hi]
  k = lo
  until left.empty? || right.empty?
    a[k] = left.first <= right.first ? left.shift : right.shift
    k += 1
  end
  (left + right).each do |x|
    a[k] = x
    k += 1
  end
end

def tim_sort(items)
  a = items.dup
  n = a.size
  0.step(n - 1, MIN_RUN) { |lo| insertion_sort!(a, lo, [lo + MIN_RUN - 1, n - 1].min) }
  size = MIN_RUN
  while size < n
    0.step(n - 1, 2 * size) do |lo|
      mid = [lo + size - 1, n - 1].min
      hi = [lo + 2 * size - 1, n - 1].min
      merge!(a, lo, mid, hi) if mid < hi
    end
    size *= 2
  end
  a
end

rng = Random.new(42)
data = Array.new(1000) { rng.rand(10_000) }
puts "matches sort: #{tim_sort(data) == data.sort}"
p tim_sort([5, 21, 7, 23, 19, 1, 0, 42])
