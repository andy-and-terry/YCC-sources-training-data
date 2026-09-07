function! HeapPush(heap, val)
  call add(a:heap, a:val)
  let i = len(a:heap) - 1
  while i > 0
    let parent = (i - 1) / 2
    if a:heap[parent] <= a:heap[i]
      break
    endif
    let tmp = a:heap[parent]
    let a:heap[parent] = a:heap[i]
    let a:heap[i] = tmp
    let i = parent
  endwhile
endfunction

function! HeapPop(heap)
  let top = a:heap[0]
  let last = remove(a:heap, len(a:heap) - 1)
  if !empty(a:heap)
    let a:heap[0] = last
    let i = 0
    while 1
      let left = 2 * i + 1
      let right = 2 * i + 2
      let smallest = i
      if left < len(a:heap) && a:heap[left] < a:heap[smallest]
        let smallest = left
      endif
      if right < len(a:heap) && a:heap[right] < a:heap[smallest]
        let smallest = right
      endif
      if smallest == i
        break
      endif
      let tmp = a:heap[smallest]
      let a:heap[smallest] = a:heap[i]
      let a:heap[i] = tmp
      let i = smallest
    endwhile
  endif
  return top
endfunction

let heap = []
call HeapPush(heap, 5)
call HeapPush(heap, 3)
call HeapPush(heap, 8)
call HeapPush(heap, 1)
call HeapPush(heap, 4)
echo HeapPop(heap)
echo HeapPop(heap)
echo HeapPop(heap)
