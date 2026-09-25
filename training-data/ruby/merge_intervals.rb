def merge_intervals(intervals)
  sorted = intervals.sort_by(&:first)
  merged = [sorted.first]

  sorted.drop(1).each do |current|
    last = merged.last
    if current.first <= last.last
      last[1] = [last.last, current.last].max
    else
      merged << current
    end
  end

  merged
end

puts merge_intervals([[1, 3], [2, 6], [8, 10], [15, 18]]).inspect
puts merge_intervals([[1, 4], [4, 5]]).inspect
