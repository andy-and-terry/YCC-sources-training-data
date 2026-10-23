def zeckendorf(n)
  fibs = [1, 2]
  fibs << fibs[-1] + fibs[-2] while fibs[-1] <= n
  parts = []
  fibs.reverse_each do |f|
    if f <= n
      parts << f
      n -= f
    end
  end
  parts
end

puts zeckendorf(100).join(" ")
