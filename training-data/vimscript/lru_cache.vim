function! NewLruCache(capacity)
  return {'capacity': a:capacity, 'map': {}, 'order': []}
endfunction

function! LruGet(cache, key)
  let k = string(a:key)
  if has_key(a:cache.map, k)
    call filter(a:cache.order, 'v:val != a:key')
    call add(a:cache.order, a:key)
    return a:cache.map[k]
  endif
  return -1
endfunction

function! LruPut(cache, key, value)
  let k = string(a:key)
  if has_key(a:cache.map, k)
    call filter(a:cache.order, 'v:val != a:key')
  endif
  let a:cache.map[k] = a:value
  call add(a:cache.order, a:key)
  if len(a:cache.order) > a:cache.capacity
    let evict = remove(a:cache.order, 0)
    call remove(a:cache.map, string(evict))
  endif
endfunction

let cache = NewLruCache(2)
call LruPut(cache, 1, 1)
call LruPut(cache, 2, 2)
echo LruGet(cache, 1)
call LruPut(cache, 3, 3)
echo LruGet(cache, 2)
