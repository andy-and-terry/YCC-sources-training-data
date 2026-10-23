" reltime() measures elapsed time with high resolution.
function! Work(n) abort
  let sum = 0
  for i in range(a:n)
    let sum += i * i
  endfor
  return sum
endfunction

let start = reltime()
let result = Work(20000)
let elapsed = reltime(start)

echo 'result: ' . result
echo 'elapsed is a list: ' . (type(elapsed) == v:t_list)
echo 'seconds >= 0: ' . (reltimefloat(elapsed) >= 0.0)
echo 'formatted has dot: ' . (reltimestr(elapsed) =~ '\.')

" Compare two time points.
let t1 = reltime()
let t2 = reltime()
echo 'ordered: ' . (reltimefloat(reltime(t1, t2)) >= 0.0)
