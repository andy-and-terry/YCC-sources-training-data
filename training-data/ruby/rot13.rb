def rot13(s) = s.tr('A-Za-z', 'N-ZA-Mn-za-m')

def rot_n(s, n)
  s.gsub(/[a-z]/i) do |c|
    base = c.ord < 97 ? 65 : 97
    ((c.ord - base + n) % 26 + base).chr
  end
end

if ARGV.first == '-'
  $stdin.each_line { |line| print rot13(line) }
else
  text = 'Why did the chicken cross the road?'
  puts rot13(text)
  puts rot13(rot13(text)) == text, rot_n(rot_n(text, 3), -3) == text
end
