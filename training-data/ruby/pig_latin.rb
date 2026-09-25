def pig_word(word)
  case word
  when /\A[aeiou]/i then "#{word}way"
  when /\A(qu|[^aeiou]+)(.+)\z/i then "#{Regexp.last_match(2)}#{Regexp.last_match(1)}ay"
  else "#{word}ay"
  end
end

puts 'the quick brown fox jumps over the lazy dog'.split.map { |w| pig_word(w) }.join(' ')
