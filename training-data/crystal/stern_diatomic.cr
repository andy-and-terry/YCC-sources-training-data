def stern(count : Int32) : Array(Int32)
  seq = [0, 1]
  (2...count).each do |i|
    seq << (i.even? ? seq[i // 2] : seq[i // 2] + seq[i // 2 + 1])
  end
  seq.first(count)
end

puts stern(15).join(" ") # 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
