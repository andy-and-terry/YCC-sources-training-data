name = "Ruby"
version = 3

text = <<~TEXT
  Welcome to #{name}
    indented line stays indented
  Version: #{version}
TEXT
puts text

raw = <<~'RAW'
  No #{interpolation} here\n
RAW
puts raw

puts format("%-8s|%5d|%8.3f", "ab", 42, 3.14159)
puts "%05.1f%%" % 7.25
puts "%s is %d" % ["x", 5]
puts "abc".ljust(6, ".") + "|" + "abc".rjust(6) + "|" + "abc".center(7, "*")
puts 1234567.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
