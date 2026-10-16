s = "héllo"
puts s.length, s.bytesize
puts s.chars.inspect
puts s.bytes.first(3).inspect
puts s.each_char.with_index.map { |c, i| "#{i}:#{c}" }.join(" ")
puts s.codepoints.inspect
puts s.encoding, s.force_encoding("ASCII-8BIT").length
puts s.force_encoding("UTF-8").valid_encoding?
puts "abc".unpack("C*").inspect, [104, 105].pack("c*")
puts "日本語".reverse, "日本語".bytes.size
puts "ß".upcase, "ǅ".downcase
puts "é" == "é", "é".unicode_normalize == "é"
puts "abc".each_grapheme_cluster.to_a.size
puts "a\tb".dump
