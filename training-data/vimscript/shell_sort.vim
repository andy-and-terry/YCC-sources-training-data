" Shell sort using the halving gap sequence.
function! s:ShellSort(a) abort
  let l:gap = len(a:a) / 2
  while l:gap > 0
    for l:i in range(l:gap, len(a:a) - 1)
      let l:tmp = a:a[l:i]
      let l:j = l:i
      while l:j >= l:gap && a:a[l:j - l:gap] > l:tmp
        let a:a[l:j] = a:a[l:j - l:gap]
        let l:j -= l:gap
      endwhile
      let a:a[l:j] = l:tmp
    endfor
    let l:gap = l:gap / 2
  endwhile
  return a:a
endfunction
echo s:ShellSort([23, 12, 1, 8, 34, 54, 2, 3])
