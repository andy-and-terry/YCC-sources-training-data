def affine(text, a, b, decrypt: false)
  inv = (1...26).find { |x| (a * x) % 26 == 1 }
  text.gsub(/[A-Z]/) do |ch|
    x = ch.ord - 65
    y = decrypt ? (inv * (x - b)) % 26 : (a * x + b) % 26
    (y + 65).chr
  end
end

c = affine("AFFINE", 5, 8)
puts "#{c} #{affine(c, 5, 8, decrypt: true)}"
