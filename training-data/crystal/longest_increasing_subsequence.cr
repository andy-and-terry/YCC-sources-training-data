def longest_increasing_subsequence(nums : Array(Int32)) : Int32
  return 0 if nums.empty?

  tails = [] of Int32
  nums.each do |num|
    lo, hi = 0, tails.size
    while lo < hi
      mid = (lo + hi) // 2
      if tails[mid] < num
        lo = mid + 1
      else
        hi = mid
      end
    end
    if lo == tails.size
      tails << num
    else
      tails[lo] = num
    end
  end
  tails.size
end

puts longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18])
puts longest_increasing_subsequence([0, 1, 0, 3, 2, 3])
puts longest_increasing_subsequence([7, 7, 7, 7])
