const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

proc b64(s: string): string =
  var i = 0
  while i < s.len:
    let b0 = ord(s[i])
    let b1 = if i + 1 < s.len: ord(s[i + 1]) else: 0
    let b2 = if i + 2 < s.len: ord(s[i + 2]) else: 0
    let n = (b0 shl 16) or (b1 shl 8) or b2
    result.add(alphabet[(n shr 18) and 63])
    result.add(alphabet[(n shr 12) and 63])
    result.add(if i + 1 < s.len: alphabet[(n shr 6) and 63] else: '=')
    result.add(if i + 2 < s.len: alphabet[n and 63] else: '=')
    i += 3

echo b64("Man")
echo b64("Ma")
echo b64("hello world")
