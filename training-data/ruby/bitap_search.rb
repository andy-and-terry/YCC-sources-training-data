def bitap(text, pat)
  masks = Hash.new(0)
  pat.each_char.with_index { |c, i| masks[c] |= 1 << i }
  goal = 1 << (pat.size - 1)
  state = 0
  text.each_char.with_index do |c, i|
    state = ((state << 1) | 1) & masks[c]
    return i - pat.size + 1 if state & goal != 0
  end
  -1
end

puts bitap("the quick brown fox", "brown")
