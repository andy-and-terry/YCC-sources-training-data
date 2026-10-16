" Backslash line continuation in lists, dicts and expressions.
let s:colors = [
      \ 'red',
      \ 'green',
      \ 'blue',
      \ ]
let s:total = 1
      \ + 2
      \ + 3
let s:opts = {
      \ 'width': 80,
      \ 'wrap': v:true,
      \ }
echo s:colors s:total s:opts
