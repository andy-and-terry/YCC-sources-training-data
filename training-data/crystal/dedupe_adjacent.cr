# Remove consecutive duplicate characters.
puts "aabbbcdd".chars.chunks { |c| c }.map { |(c, _)| c }.join
