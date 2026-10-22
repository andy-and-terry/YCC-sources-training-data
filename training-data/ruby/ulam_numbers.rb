def ulam(count)
  seq = [1, 2]
  n = 2
  while seq.size < count
    n += 1
    ways = seq.count { |a| a < n - a && seq.include?(n - a) }
    seq << n if ways == 1
  end
  seq
end

puts ulam(15).join(" ")
