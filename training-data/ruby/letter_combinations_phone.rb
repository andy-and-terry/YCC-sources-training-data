KEYPAD = { '2' => 'abc', '3' => 'def', '4' => 'ghi', '5' => 'jkl', '6' => 'mno', '7' => 'pqrs', '8' => 'tuv', '9' => 'wxyz' }.freeze

def letter_combinations(digits)
  return [] if digits.empty?

  first, *rest = digits.chars.map { |d| KEYPAD.fetch(d).chars }
  first.product(*rest).map(&:join)
end

p letter_combinations('23')
p letter_combinations('7979').size
