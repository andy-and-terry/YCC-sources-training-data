# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
row = [1]
out = [1]
9.times do
  nxt = [0]
  row.reverse_each { |x| nxt << nxt.last + x }
  row = nxt
  out << row.last
end
puts out.join(" ")
