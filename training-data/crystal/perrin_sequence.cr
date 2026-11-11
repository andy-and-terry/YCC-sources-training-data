# Perrin sequence P(n)=P(n-2)+P(n-3)
v = [3, 0, 2]
(3...10).each { |i| v << v[i - 2] + v[i - 3] }
puts v.join(" ")
