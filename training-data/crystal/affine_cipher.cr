def mod_inverse(a : Int32, m : Int32) : Int32
  (1...m).find { |x| a * x % m == 1 }.not_nil!
end

def affine(s : String, a : Int32, b : Int32, decrypt = false) : String
  inv = mod_inverse(a, 26)
  s.gsub(/[A-Z]/) do |ch|
    x = ch[0].ord - 65
    y = decrypt ? (inv * (x - b)) % 26 : (a * x + b) % 26
    (y + 65).chr.to_s
  end
end

c = affine("AFFINE", 5, 8)
puts "#{c} #{affine(c, 5, 8, true)}"
