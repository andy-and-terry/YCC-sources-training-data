function! NewCircularBuffer(capacity)
  return {'data': repeat([0], a:capacity), 'capacity': a:capacity, 'size': 0, 'start': 0}
endfunction

function! PushBuffer(buf, value)
  let index = (a:buf.start + a:buf.size) % a:buf.capacity
  let a:buf.data[index] = a:value
  if a:buf.size < a:buf.capacity
    let a:buf.size += 1
  else
    let a:buf.start = (a:buf.start + 1) % a:buf.capacity
  endif
endfunction

let buf = NewCircularBuffer(3)
for v in [1, 2, 3, 4, 5]
  call PushBuffer(buf, v)
endfor
echo buf.data
