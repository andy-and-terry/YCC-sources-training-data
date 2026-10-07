def josephus(n, k)
  result = 0
  (2..n).each { |i| result = (result + k) % i }
  result
end

def josephus_simulation(n, k)
  people = (0...n).to_a
  idx = 0
  while people.size > 1
    idx = (idx + k - 1) % people.size
    people.delete_at(idx)
  end
  people.first
end

puts josephus(7, 3)
puts josephus_simulation(7, 3)
raise "mismatch" unless josephus(41, 3) == josephus_simulation(41, 3)
