words = %w[apple banana avocado blueberry cherry]

by_letter = words.each_with_object(Hash.new { |h, k| h[k] = [] }) do |word, memo|
  memo[word[0]] << word
end
puts by_letter.inspect

totals = [["a", 1], ["b", 2], ["a", 3]].each_with_object(Hash.new(0)) do |(key, amount), memo|
  memo[key] += amount
end
puts totals.inspect

unique_in_order = [1, 2, 2, 3, 1, 4].each_with_object([]) do |n, memo|
  memo << n unless memo.include?(n)
end
puts unique_in_order.inspect
