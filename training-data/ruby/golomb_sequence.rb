# a(n) = 1 + a(n - a(a(n-1))), 1-based indexing
def golomb(count)
  a = [0, 1]
  (2..count).each { |n| a[n] = 1 + a[n - a[a[n - 1]]] }
  a[1..]
end

puts golomb(20).join(" ")
