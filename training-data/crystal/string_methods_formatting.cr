s = "Hello, World"
puts s.size, s.upcase, s.downcase, s.reverse, s[7..], s[0, 5], s.index("o"), s.rindex("o")
puts s.sub("World", "Crystal"), s.gsub(/o/, "0"), s.tr("lo", "01"), s.delete("l"), s.squeeze("l")
puts s.split(", ").inspect, s.chars.first(3).inspect, s.bytes.size, s.starts_with?("Hell"), s.includes?("lo, W")
puts "%05.1f|%-6s|%3d|%x" % [3.14159, "ab", 7, 255]
puts 3.14159.round(2), 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
puts "ab".ljust(5, '.') + "|", "ab".rjust(5, '.'), "ab".center(6, '*'), "abc" * 2
puts "snake_case_word".split('_').map(&.capitalize).join, "CamelCase".gsub(/([A-Z])/) { "_" + $1.downcase }.lstrip('_')
puts "a1b22".scan(/\d+/).map(&.[0]).inspect
if m = /(\d+)-(\d+)/.match("tel 555-1234")
  puts m[1], m[2], m.pre_match
end
puts "line1\nline2".lines.inspect, "  pad  ".strip + "|", "x".ord, 97.chr, "abc".succ
puts String.build { |io| 3.times { |i| io << i << "," } }
