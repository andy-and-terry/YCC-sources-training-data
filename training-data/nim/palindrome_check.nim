import strutils

proc isPalindrome(s: string): bool =
  var normalized = ""
  for c in s.toLowerAscii:
    if c.isAlphaNumeric:
      normalized.add(c)
  result = normalized == normalized.reversed

echo isPalindrome("A man, a plan, a canal: Panama")
echo isPalindrome("hello")
