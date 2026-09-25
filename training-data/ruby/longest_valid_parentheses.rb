def longest_valid(s)
  stack = [-1]
  best = 0
  s.each_char.with_index do |c, i|
    if c == '('
      stack.push(i)
    else
      stack.pop
      if stack.empty?
        stack.push(i)
      else
        best = [best, i - stack.last].max
      end
    end
  end
  best
end

['(()', ')()())', '', '()(()', '((()))()'].each { |s| puts "#{s.inspect} #{longest_valid(s)}" }
