puts "%05.1f|%-6s|%+d|%x|%e" % [3.14159, "ab", 5, 255, 12345.678]
puts "snake_case_word".split("_").map.with_index { |w, i| i.zero? ? w : w.capitalize }.join
puts "hello world".center(21, "*"), "abc".succ, "az".succ, "a-b_c".tr("-_", "  ")
puts "The Quick".swapcase, "ruby" * 2, "a,b;c".split(/[,;]/).inspect
puts "été".bytes.size, "été".length, "line1\nline2".lines.map(&:chomp).inspect
