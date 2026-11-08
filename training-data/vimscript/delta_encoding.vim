function! DeltaEncode(xs) abort
  return [a:xs[0]] + map(range(1, len(a:xs) - 1), {_, i -> a:xs[i] - a:xs[i - 1]})
endfunction

function! DeltaDecode(ds) abort
  let acc = 0
  let out = []
  for d in a:ds
    let acc += d
    call add(out, acc)
  endfor
  return out
endfunction

let d = DeltaEncode([10, 12, 15, 15, 20])
echo d
