let tmp = tempname()
call writefile(['first', 'second', 'third'], tmp)
echo readfile(tmp)
echo readfile(tmp, '', 2)
call writefile(['appended'], tmp, 'a')
echo len(readfile(tmp)) filereadable(tmp) getfsize(tmp)
let lines = readfile(tmp)
call map(lines, 'toupper(v:val)')
call writefile(lines, tmp)
echo readfile(tmp)[0]
echo fnamemodify(tmp, ':t') =~ '^\d\+$' || 1
echo isdirectory(fnamemodify(tmp, ':h'))
let dir = tmp . '_dir'
call mkdir(dir)
call writefile([], dir . '/a.txt')
call writefile([], dir . '/b.log')
echo map(glob(dir . '/*', 0, 1), 'fnamemodify(v:val, ":t")')
echo map(globpath(dir, '*.txt', 0, 1), 'fnamemodify(v:val, ":t")')
echo delete(dir . '/a.txt') delete(dir . '/b.log') delete(dir, 'd') delete(tmp)
echo filereadable(tmp) isdirectory(dir)
echo system('echo hi')[:-2] v:shell_error
echo json_encode({'a': [1, 2]}) json_decode('{"k": [1, {"z": null}]}')
echo exists('$HOME') $HOME != ''
