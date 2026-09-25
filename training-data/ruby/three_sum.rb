def three_sum(nums, target = 0)
  a = nums.sort
  res = []
  (0...a.size - 2).each do |i|
    next if i.positive? && a[i] == a[i - 1]

    lo = i + 1
    hi = a.size - 1
    while lo < hi
      case a[i] + a[lo] + a[hi] <=> target
      when -1 then lo += 1
      when 1 then hi -= 1
      else
        res << [a[i], a[lo], a[hi]]
        lo += 1 while lo < hi && a[lo] == a[lo + 1]
        hi -= 1 while lo < hi && a[hi] == a[hi - 1]
        lo += 1
        hi -= 1
      end
    end
  end
  res
end

p three_sum([-1, 0, 1, 2, -1, -4])
p three_sum([1, 2, 3, 4, 5, 6], 10)
# brute force check
p [1, 2, 3, 4, 5, 6].combination(3).select { |c| c.sum == 10 }
