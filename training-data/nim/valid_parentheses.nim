import tables

proc isValid(s: string): bool =
  var stack: seq[char] = @[]
  let pairs = {')': '(', ']': '[', '}': '{'}.toTable
  for c in s:
    if c in ['(', '[', '{']:
      stack.add(c)
    elif c in [')', ']', '}']:
      if stack.len == 0 or stack.pop() != pairs[c]:
        return false
  result = stack.len == 0

echo isValid("{[()]}")
echo isValid("{[(])}")
