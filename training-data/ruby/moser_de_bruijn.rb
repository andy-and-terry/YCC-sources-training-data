# Reinterpret the binary digits of i as base-4 digits.
def moser_de_bruijn(i)
  i.to_s(2).to_i(4)
end

puts (0...10).map { |i| moser_de_bruijn(i) }.join(" ") # 0 1 4 5 16 17 20 21 64 65
