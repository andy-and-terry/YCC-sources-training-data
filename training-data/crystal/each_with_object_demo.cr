words = %w(apple avocado banana blueberry cherry)

by_letter = words.each_with_object(Hash(Char, Array(String)).new) do |w, acc|
  (acc[w[0]] ||= [] of String) << w
end
puts by_letter

lengths = words.each_with_index.map { |w, i| "#{i}:#{w.size}" }.to_a
puts lengths.join(" ")

counts = words.each_with_object(Hash(Int32, Int32).new(0)) { |w, h| h[w.size] += 1 }
puts counts

puts words.each_cons(2).map { |(a, b)| a[0] == b[0] }.to_a.inspect
