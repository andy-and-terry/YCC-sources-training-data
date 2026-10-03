# Min-heap of size k built with a simple sorted array, since Ruby has no
# built-in heap; kept intentionally simple for a training-data sample.
def kth_largest(nums, k)
  heap = []
  nums.each do |n|
    heap << n
    heap.sort!
    heap.shift if heap.size > k
  end
  heap.first
end

puts kth_largest([3, 2, 1, 5, 6, 4], 2)
puts kth_largest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)
