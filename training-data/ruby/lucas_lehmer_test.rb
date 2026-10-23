def prime?(n)
  n > 1 && (2..Math.sqrt(n)).none? { |d| (n % d).zero? }
end

def lucas_lehmer?(p)
  return true if p == 2
  m = (1 << p) - 1
  s = 4
  (p - 2).times { s = (s * s - 2) % m }
  s.zero?
end

puts (2..19).select { |p| prime?(p) && lucas_lehmer?(p) }.join(" ")
