def longest_common_prefix(words)
  return '' if words.empty?

  lo, hi = words.minmax
  lo.chars.zip(hi.chars).take_while { |a, b| a == b }.map(&:first).join
end

p longest_common_prefix(%w[flower flow flight])
p longest_common_prefix(%w[dog racecar car])
p longest_common_prefix(%w[interspecies interstellar interstate])
