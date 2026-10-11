" Gnome sort: step back on inversion, forward otherwise.
function! s:GnomeSort(a) abort
  let l:i = 0
  while l:i < len(a:a)
    if l:i == 0 || a:a[l:i - 1] <= a:a[l:i]
      let l:i += 1
    else
      let [a:a[l:i - 1], a:a[l:i]] = [a:a[l:i], a:a[l:i - 1]]
      let l:i -= 1
    endif
  endwhile
  return a:a
endfunction
echo s:GnomeSort([5, 2, 9, 1, 5, 6])
