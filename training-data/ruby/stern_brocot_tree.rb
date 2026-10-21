def path(p, q)
  g = p.gcd(q)
  p /= g
  q /= g
  lo = [0, 1]
  hi = [1, 0]
  s = +""
  loop do
    mid = [lo[0] + hi[0], lo[1] + hi[1]]
    return s if mid == [p, q]
    if p * mid[1] < mid[0] * q
      s << "L"
      hi = mid
    else
      s << "R"
      lo = mid
    end
  end
end

puts path(3, 5)
