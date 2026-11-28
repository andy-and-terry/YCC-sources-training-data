let s:seq = [0, 1]
for s:i in range(2, 14)
  let s:h = s:i / 2
  call add(s:seq, s:i % 2 == 0 ? s:seq[s:h] : s:seq[s:h] + s:seq[s:h + 1])
endfor
echo join(s:seq, ' ') " 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
