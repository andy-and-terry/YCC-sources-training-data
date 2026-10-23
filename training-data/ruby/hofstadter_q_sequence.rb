# Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), Q(1) = Q(2) = 1
def hofstadter_q(count)
  q = [0, 1, 1]
  (3..count).each { |n| q[n] = q[n - q[n - 1]] + q[n - q[n - 2]] }
  q[1..]
end

puts hofstadter_q(20).join(" ")
