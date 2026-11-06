" Bulls and Cows scoring for equal-length digit strings.
function! Score(secret, guess) abort
  let l:bulls = 0
  let l:sc = {}
  let l:gc = {}
  for l:i in range(len(a:secret))
    let l:s = a:secret[l:i]
    let l:g = a:guess[l:i]
    if l:s ==# l:g
      let l:bulls += 1
    else
      let l:sc[l:s] = get(l:sc, l:s, 0) + 1
      let l:gc[l:g] = get(l:gc, l:g, 0) + 1
    endif
  endfor
  let l:cows = 0
  for [l:c, l:n] in items(l:sc)
    let l:cows += min([l:n, get(l:gc, l:c, 0)])
  endfor
  return [l:bulls, l:cows]
endfunction

let [s:b, s:c] = Score('1807', '7810')
echo s:b . ' bull(s), ' . s:c . ' cow(s)'
