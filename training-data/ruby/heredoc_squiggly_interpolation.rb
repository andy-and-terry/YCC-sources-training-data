name = "Ada"
text = <<~EOS
  Hello, #{name}!
    indented line
  Total: #{'%.2f' % 12.5}
EOS
puts text
raw = <<~'EOS'
  no #{interpolation} here\n
EOS
puts raw
