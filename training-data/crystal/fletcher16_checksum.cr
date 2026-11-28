def fletcher16(data : Bytes) : Int32
  s1 = 0
  s2 = 0
  data.each do |b|
    s1 = (s1 + b) % 255
    s2 = (s2 + s1) % 255
  end
  (s2 << 8) | s1
end

puts fletcher16("abcde".to_slice).to_s(16)
