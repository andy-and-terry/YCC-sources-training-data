# Moser-de Bruijn sequence: binary digits of n read in base 4.
puts (0...12).map { |n| n.to_s(2).to_i(4) }.join(" ")
