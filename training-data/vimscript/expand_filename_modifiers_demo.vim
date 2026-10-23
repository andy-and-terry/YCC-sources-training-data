" Filename modifiers via fnamemodify() and expand() on a literal path.
let path = '/home/user/projects/app/src/main.test.js'

echo fnamemodify(path, ':t')
echo fnamemodify(path, ':h')
echo fnamemodify(path, ':r')
echo fnamemodify(path, ':e')
echo fnamemodify(path, ':t:r')
echo fnamemodify(path, ':t:r:r')
echo fnamemodify(path, ':h:t')
echo fnamemodify(path, ':h:h')

" Build a sibling file name.
let sibling = fnamemodify(path, ':r') . '.css'
echo sibling

" expand() with special words and wildcards.
echo expand('<sfile>') ==# '' ? 'no sfile at top level' : 'has sfile'
echo type(expand('$HOME')) == v:t_string
echo expand('/nonexistent_dir_xyz/*.txt', 0, 1)
echo fnamemodify('relative.txt', ':p') =~# 'relative.txt$'
