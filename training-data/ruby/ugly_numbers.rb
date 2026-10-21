def nth_ugly(n)
  u = [1]
  i2 = i3 = i5 = 0
  while u.size < n
    nx = [u[i2] * 2, u[i3] * 3, u[i5] * 5].min
    u << nx
    i2 += 1 if nx == u[i2] * 2
    i3 += 1 if nx == u[i3] * 3
    i5 += 1 if nx == u[i5] * 5
  end
  u[n - 1]
end

puts (1..15).map { |k| nth_ugly(k) }.join(" ")
