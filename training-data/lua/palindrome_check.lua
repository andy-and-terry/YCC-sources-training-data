local function is_palindrome(s)
  local normalized = s:lower():gsub("[^%w]", "")
  return normalized == normalized:reverse()
end

print(is_palindrome("A man, a plan, a canal: Panama"))
print(is_palindrome("hello"))
