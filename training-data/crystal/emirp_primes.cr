def prime?(n : Int32) : Bool
  return false if n < 2
  i = 2
  while i * i <= n
    return false if n % i == 0
    i += 1
  end
  true
end

def rev(n : Int32) : Int32
  n.to_s.reverse.to_i
end

puts (2...100).select { |p| prime?(p) && rev(p) != p && prime?(rev(p)) }
