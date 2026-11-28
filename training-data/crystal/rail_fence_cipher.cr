def order(n : Int32, k : Int32) : Array(Int32)
  cycle = 2 * (k - 1)
  (0...n).to_a.sort_by { |i| r = i % cycle; {r < k ? r : cycle - r, i} }
end

def encrypt(t : String, k : Int32) : String
  chars = t.chars
  order(chars.size, k).map { |i| chars[i] }.join
end

def decrypt(c : String, k : Int32) : String
  chars = c.chars
  out = Array(Char).new(chars.size, ' ')
  order(chars.size, k).each_with_index { |i, pos| out[i] = chars[pos] }
  out.join
end

c = encrypt("WEAREDISCOVERED", 3)
puts "#{c} #{decrypt(c, 3)}"
