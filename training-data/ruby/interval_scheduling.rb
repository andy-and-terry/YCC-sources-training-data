Meeting = Struct.new(:name, :start, :finish)

def max_non_overlapping(meetings)
  last_end = -Float::INFINITY
  meetings.sort_by(&:finish).select do |m|
    next false if m.start < last_end

    last_end = m.finish
  end
end

def merge_ranges(ranges)
  ranges.sort_by(&:begin).each_with_object([]) do |r, out|
    if out.any? && r.begin <= out.last.end
      out[-1] = out.last.begin..[out.last.end, r.end].max
    else
      out << r
    end
  end
end

m = [[1, 4], [3, 5], [0, 6], [5, 7], [3, 9], [5, 9], [6, 10], [8, 11], [8, 12], [2, 14], [12, 16]]
      .each_with_index.map { |(s, f), i| Meeting.new("m#{i}", s, f) }
p max_non_overlapping(m).map { |x| [x.start, x.finish] }
p merge_ranges([1..4, 3..5, 8..10, 9..12, 15..18])
