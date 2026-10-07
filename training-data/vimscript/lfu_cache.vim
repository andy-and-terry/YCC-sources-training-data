function! NewLfuCache(capacity)
  return {'capacity': a:capacity, 'values': {}, 'freqs': {}}
endfunction

function! LfuTouch(cache, key)
  let a:cache.freqs[a:key] += 1
endfunction

function! LfuGet(cache, key)
  let k = string(a:key)
  if !has_key(a:cache.values, k)
    return -1
  endif
  call LfuTouch(a:cache, k)
  return a:cache.values[k]
endfunction

function! LfuPut(cache, key, value)
  let k = string(a:key)
  if has_key(a:cache.values, k)
    let a:cache.values[k] = a:value
    call LfuTouch(a:cache, k)
    return
  endif

  if len(a:cache.values) >= a:cache.capacity
    let min_key = ''
    let min_freq = 999999
    for existing in keys(a:cache.freqs)
      if a:cache.freqs[existing] < min_freq
        let min_freq = a:cache.freqs[existing]
        let min_key = existing
      endif
    endfor
    call remove(a:cache.values, min_key)
    call remove(a:cache.freqs, min_key)
  endif

  let a:cache.values[k] = a:value
  let a:cache.freqs[k] = 0
endfunction

let cache = NewLfuCache(2)
call LfuPut(cache, 1, 10)
call LfuPut(cache, 2, 20)
echo LfuGet(cache, 1)
call LfuPut(cache, 3, 30)
echo LfuGet(cache, 2)
echo LfuGet(cache, 3)
