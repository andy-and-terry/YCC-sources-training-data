# Narayana's cows N(n)=N(n-1)+N(n-3)
v = [1, 1, 1]
(3..9).each { |i| v << v[i - 1] + v[i - 3] }
puts v.join(" ")
