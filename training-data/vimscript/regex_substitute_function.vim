function! Slug(s) abort
  return tolower(substitute(trim(a:s), '[^A-Za-z0-9]\+', '-', 'g'))
endfunction
echo Slug('  Hello, Vim World! ')
