def insert_interval(iv : Array(Tuple(Int32, Int32)), nw : Tuple(Int32, Int32))
  out = [] of Tuple(Int32, Int32)
  i = 0
  while i < iv.size && iv[i][1] < nw[0]
    out << iv[i]
    i += 1
  end
  while i < iv.size && iv[i][0] <= nw[1]
    nw = {Math.min(nw[0], iv[i][0]), Math.max(nw[1], iv[i][1])}
    i += 1
  end
  out << nw
  out.concat(iv[i..])
end

p insert_interval([{1, 3}, {6, 9}], {2, 5}) # [{1, 5}, {6, 9}]
