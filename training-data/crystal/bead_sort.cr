# Bead (gravity) sort.
def bead_sort(nums : Array(Int32)) : Array(Int32)
  cols = (0...nums.max).map { |i| nums.count { |n| n > i } }
  (0...nums.size).map { |r| cols.count { |c| c > r } }.reverse
end

p bead_sort([5, 3, 1, 4, 2])
