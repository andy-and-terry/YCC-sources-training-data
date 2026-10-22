def kolakoski(count)
  seq = [1, 2, 2]
  i = 2
  while seq.size < count
    seq.concat([3 - seq.last] * seq[i])
    i += 1
  end
  seq.first(count)
end

puts kolakoski(20).join(" ")
