def combination_sum(candidates : Array(Int32), target : Int32) : Array(Array(Int32))
  result = [] of Array(Int32)

  backtrack = uninitialized Proc(Int32, Int32, Array(Int32), Nil)
  backtrack = ->(start : Int32, remaining : Int32, current : Array(Int32)) do
    if remaining == 0
      result << current.dup
      next nil
    end
    next nil if remaining < 0

    (start...candidates.size).each do |i|
      current << candidates[i]
      backtrack.call(i, remaining - candidates[i], current)
      current.pop
    end
    nil
  end

  backtrack.call(0, target, [] of Int32)
  result
end

puts combination_sum([2, 3, 6, 7], 7).inspect
