# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
row = [1_i64]
out = [1_i64]
9.times do
  nxt = [0_i64]
  row.reverse_each { |x| nxt << nxt.last + x }
  row = nxt
  out << row.last
end
puts out.join(" ")
