" Query and manipulate windows and tab pages.
echo 'windows at start: ' . winnr('$')
echo 'tabs at start: ' . tabpagenr('$')

split
vsplit
echo 'after splits: ' . winnr('$')
echo 'current window: ' . winnr()

for nr in range(1, winnr('$'))
  let id = win_getid(nr)
  echo printf('window %d id>0=%s width>0=%s', nr, id > 0, winwidth(nr) > 0)
endfor

wincmd j
echo 'after wincmd j: ' . winnr()
only
echo 'after only: ' . winnr('$')

tabnew
echo 'tabs after tabnew: ' . tabpagenr('$')
echo 'current tab: ' . tabpagenr()
tabclose
echo 'tabs after tabclose: ' . tabpagenr('$')

let layout = winlayout()
echo 'layout kind: ' . layout[0]
