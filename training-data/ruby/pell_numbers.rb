# P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
pell = Enumerator.new do |y|
  a, b = 0, 1
  loop do
    y << a
    a, b = b, 2 * b + a
  end
end

pell.take(15).each_with_index { |p, i| puts "P(#{i}) = #{p}" }
