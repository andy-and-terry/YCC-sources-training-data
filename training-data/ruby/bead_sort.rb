# Bead (gravity) sort.
def bead_sort(nums)
  cols = Array.new(nums.max, 0)
  nums.each { |n| n.times { |i| cols[i] += 1 } }
  nums.each_index.map { |r| cols.count { |c| c > r } }.reverse
end
p bead_sort([5, 3, 1, 4, 2])
