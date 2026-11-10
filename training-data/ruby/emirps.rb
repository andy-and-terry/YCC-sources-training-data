def prime?(n)
  n >= 2 && (2..Integer.sqrt(n)).none? { |d| (n % d).zero? }
end

out = []
n = 2
while out.size < 10
  r = n.to_s.reverse.to_i
  out << n if r != n && prime?(n) && prime?(r)
  n += 1
end
puts out.join(" ") # 13 17 31 37 71 73 79 97 107 113
