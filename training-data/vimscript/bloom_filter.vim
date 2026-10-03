let s:bit_count = 64
let s:bits = repeat([0], s:bit_count)

function! BfHash(str, seed)
  let h = a:seed
  for c in split(a:str, '\zs')
    let h = (h * 31 + char2nr(c)) % s:bit_count
  endfor
  return h < 0 ? h + s:bit_count : h
endfunction

function! BfInsert(str)
  for seed in [7, 17, 29]
    let s:bits[BfHash(a:str, seed)] = 1
  endfor
endfunction

function! BfMightContain(str)
  for seed in [7, 17, 29]
    if s:bits[BfHash(a:str, seed)] == 0
      return 0
    endif
  endfor
  return 1
endfunction

call BfInsert('apple')
call BfInsert('banana')
echo BfMightContain('apple')
echo BfMightContain('banana')
echo BfMightContain('cherry')
