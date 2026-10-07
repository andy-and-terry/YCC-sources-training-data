let entries = [
      \ {'filename': 'main.c', 'lnum': 10, 'text': 'unused variable x'},
      \ {'filename': 'main.c', 'lnum': 25, 'text': 'missing semicolon'},
      \ {'filename': 'util.c', 'lnum': 3, 'text': 'undefined reference'},
      \ ]

call setqflist(entries)

let qf = getqflist()
echo len(qf)
for item in qf
  echo item.filename . ':' . item.lnum . ': ' . item.text
endfor

call setqflist([], 'a', {'title': 'demo warnings'})
echo getqflist({'title': 1}).title
