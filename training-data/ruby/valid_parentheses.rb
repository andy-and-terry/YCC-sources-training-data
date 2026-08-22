def valid?(s)
  pairs = { ')' => '(', ']' => '[', '}' => '{' }
  stack = []
  s.each_char do |ch|
    if '([{'.include?(ch)
      stack.push(ch)
    elsif pairs.key?(ch)
      return false if stack.empty? || stack.pop != pairs[ch]
    end
  end
  stack.empty?
end

puts valid?('([{}])')
puts valid?('([)]')
