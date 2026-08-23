def valid_parens?(s : String) : Bool
  stack = [] of Char
  pairs = {')' => '(', ']' => '[', '}' => '{'}
  s.each_char do |ch|
    if pairs.values.includes?(ch)
      stack.push(ch)
    elsif pairs.keys.includes?(ch)
      return false if stack.empty? || stack.pop != pairs[ch]
    end
  end
  stack.empty?
end

puts valid_parens?("({[]})")
puts valid_parens?("(]")
