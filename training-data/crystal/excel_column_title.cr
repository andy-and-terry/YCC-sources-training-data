def column_title(n : Int32) : String
  String.build do |io|
    chars = [] of Char
    while n > 0
      n -= 1
      chars << ('A' + n % 26)
      n //= 26
    end
    io << chars.reverse.join
  end
end

puts "#{column_title(28)} #{column_title(701)}" # AB ZY
