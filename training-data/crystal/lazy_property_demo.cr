# Memoized property using ||= and a lazy getter block.
class Report
  getter data : Array(Int32) { compute }

  def initialize
    @calls = 0
  end

  def compute
    @calls += 1
    puts "computing..."
    (1..5).map { |i| i * i }
  end

  def total
    @total ||= data.sum
  end
end

r = Report.new
puts r.total
puts r.total
p r.data
