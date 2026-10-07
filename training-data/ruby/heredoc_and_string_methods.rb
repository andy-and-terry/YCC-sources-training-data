name = "world"
text = <<~EOS
  Hello, #{name}!
    indented line
  Last line
EOS
puts text

raw = <<~'EOS'
  No #{interpolation} here
EOS
puts raw

s = "Hello, Ruby"
puts s.start_with?("Hell"), s.end_with?("by"), s.index("R")
puts s[0, 5], s[-4..], s[/R\w+/]
puts s.each_char.select { |c| "aeiou".include?(c.downcase) }.join
puts s.swapcase, s.tr("lo", "01"), s.delete("l"), s.squeeze("l")
puts s.chars.each_slice(4).map(&:join).inspect
puts s * 2, s.succ, "az".succ
