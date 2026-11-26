# Goldbach partitions of 100; expect 6.
def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

pairs = (2..50).select { |p| prime?(p) && prime?(100 - p) }.map { |p| {p, 100 - p} }
puts "#{pairs.size} #{pairs}"
