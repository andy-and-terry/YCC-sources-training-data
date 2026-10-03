let s:instance = {}

function! GetConfig()
  if empty(s:instance)
    let s:instance = {'settings': 'default'}
  endif
  return s:instance
endfunction

let first = GetConfig()
let first.settings = 'production'

let second = GetConfig()
echo second.settings
echo (first is second)
