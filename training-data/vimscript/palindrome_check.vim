function! IsPalindrome(str)
  let normalized = substitute(tolower(a:str), '[^a-z0-9]', '', 'g')
  let reversed = join(reverse(split(normalized, '\zs')), '')
  return normalized ==# reversed
endfunction

echo IsPalindrome('A man, a plan, a canal: Panama')
echo IsPalindrome('hello')
