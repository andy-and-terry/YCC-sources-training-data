" Greedy sequence whose pairwise sums are all distinct.
let s:seq = []
let s:sums = {}
let s:cand = 1
while len(s:seq) < 8
  let s:fresh = {}
  let s:ok = 1
  for s:x in s:seq + [s:cand]
    let s:s = s:x + s:cand
    if has_key(s:sums, s:s) || has_key(s:fresh, s:s)
      let s:ok = 0
      break
    endif
    let s:fresh[s:s] = 1
  endfor
  if s:ok
    call add(s:seq, s:cand)
    call extend(s:sums, s:fresh)
  endif
  let s:cand += 1
endwhile
echo join(s:seq, ' ')
