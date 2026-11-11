def insert_interval(intervals, new_iv)
  before, rest = intervals.partition { |_, hi| hi < new_iv[0] }
  overlap, after = rest.partition { |lo, _| lo <= new_iv[1] }
  merged = [[new_iv[0], *overlap.map(&:first)].min, [new_iv[1], *overlap.map(&:last)].max]
  before + [merged] + after
end

p insert_interval([[1, 3], [6, 9]], [2, 5]) # [[1, 5], [6, 9]]
