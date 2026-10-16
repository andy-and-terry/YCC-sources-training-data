" Expand abbreviations in a string using a dictionary lookup.
let s:abbr = {'btw': 'by the way', 'imo': 'in my opinion', 'fyi': 'for your information'}
function! s:Expand(text) abort
  return join(map(split(a:text, ' '), {_, w -> get(s:abbr, tolower(w), w)}), ' ')
endfunction
echo s:Expand('FYI the build is green btw')
echo s:Expand('imo this is fine')
