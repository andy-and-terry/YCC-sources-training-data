def fletcher16(data)
  s1 = s2 = 0
  data.each_byte do |b|
    s1 = (s1 + b) % 255
    s2 = (s2 + s1) % 255
  end
  (s2 << 8) | s1
end

puts fletcher16("abcde").to_s(16)
