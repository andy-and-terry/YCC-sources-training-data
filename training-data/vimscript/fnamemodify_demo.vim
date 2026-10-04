let path = '/home/user/projects/app/src/main.test.js'

echo fnamemodify(path, ':t')
echo fnamemodify(path, ':t:r')
echo fnamemodify(path, ':t:r:r')
echo fnamemodify(path, ':e')
echo fnamemodify(path, ':h')
echo fnamemodify(path, ':h:t')
echo fnamemodify(path, ':h:h')
echo fnamemodify('notes.txt', ':r') . '.bak'
echo fnamemodify('rel/file.vim', ':p') =~# '^/'
echo fnamemodify('~', ':p') !=# '~'

echo split(path, '/')[-1]
echo join(split(path, '/')[:2], '/')
echo isdirectory('/tmp')
echo filereadable('/definitely/not/here')
