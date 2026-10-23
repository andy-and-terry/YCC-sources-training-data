def kolakoski(count)
  seq = [1, 2, 2]
  i = 2
  while seq.size < count
    value = seq.last == 2 ? 1 : 2
    seq.concat([value] * seq[i])
    i += 1
  end
  seq.first(count)
end

puts kolakoski(20).join(" ")
