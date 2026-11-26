# Emirps below 200; expect 15.
def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

def rev(n : Int32) : Int32
  n.to_s.reverse.to_i
end

found = (2...200).select { |n| rev(n) != n && prime?(n) && prime?(rev(n)) }
puts "#{found.size} #{found}"
