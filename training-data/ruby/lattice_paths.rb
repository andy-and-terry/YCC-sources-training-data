# Lattice paths via a rolling DP row.
def lattice_paths(n)
  row = Array.new(n + 1, 1)
  n.times { (1..n).each { |j| row[j] += row[j - 1] } }
  row[n]
end
puts lattice_paths(3)
