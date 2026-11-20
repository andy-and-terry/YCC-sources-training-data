# Lattice paths with a DP row.
def lattice(n : Int32) : Int64
  row = Array.new(n + 1, 1_i64)
  n.times { (1..n).each { |j| row[j] += row[j - 1] } }
  row[n]
end

puts lattice(3)
