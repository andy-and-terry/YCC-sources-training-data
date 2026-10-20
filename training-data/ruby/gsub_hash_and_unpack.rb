puts "cat hat".gsub(/[ch]at/, "cat" => "dog", "hat" => "cap")
puts [1, 2, 3].pack("C*").bytes.inspect, "AB".unpack("C*").inspect, [65, 66].pack("U*")
puts ["abc"].pack("m0"), "YWJj".unpack1("m")
puts "hello"[1..3], "hello"[-3..], "hello".slice(0, 2), "hello".each_char.to_a.each_slice(2).map(&:join).inspect
