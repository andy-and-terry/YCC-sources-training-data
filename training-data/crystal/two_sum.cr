def two_sum(nums : Array(Int32), target : Int32) : Tuple(Int32, Int32)?
  seen = {} of Int32 => Int32
  nums.each_with_index do |n, i|
    complement = target - n
    return {seen[complement], i} if seen.has_key?(complement)
    seen[n] = i
  end
  nil
end

puts two_sum([2, 7, 11, 15], 9).inspect
