def order(n, k)
  cycle = 2 * (k - 1)
  rail = ->(i) { r = i % cycle; r < k ? r : cycle - r }
  (0...n).sort_by { |i| [rail.(i), i] }
end

def encrypt(t, k)
  order(t.size, k).map { |i| t[i] }.join
end

def decrypt(c, k)
  out = Array.new(c.size)
  order(c.size, k).each_with_index { |i, pos| out[i] = c[pos] }
  out.join
end

c = encrypt("WEAREDISCOVERED", 3)
puts "#{c} #{decrypt(c, 3)}"
