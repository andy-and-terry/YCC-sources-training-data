words = %w[apple Banana cherry date]

puts words.map(&:upcase).inspect
puts words.map(&:length).inspect
puts words.select(&:frozen?).size
puts [1, 2, 3, 4].inject(&:+)
puts [[1, 2], [3, 4]].map(&:sum).inspect

class Tag
  def to_proc
    ->(s) { "<#{s}>" }
  end
end
puts words.first(2).map(&Tag.new).inspect

add = :+.to_proc
puts add.call(2, 3)

double = 2.method(:*)
puts [1, 2, 3].map(&double).inspect

compose = :upcase.to_proc >> :reverse.to_proc
puts compose.call("abc")

puts words.sort_by(&:downcase).inspect
puts words.group_by(&:size).inspect
puts words.each_with_index.map { |w, i| [i, w] }.to_h.inspect
