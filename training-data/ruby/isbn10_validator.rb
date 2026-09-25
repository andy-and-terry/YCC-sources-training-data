def valid_isbn10?(isbn)
  s = isbn.delete("-")
  return false unless s.match?(/\A\d{9}[\dX]\z/)

  s.chars.each_with_index.sum { |c, i| (c == "X" ? 10 : c.to_i) * (10 - i) } % 11 == 0
end

%w[3-598-21508-8 3-598-21507-X 3-598-21508-9].each { |s| puts "#{s} #{valid_isbn10?(s)}" }
