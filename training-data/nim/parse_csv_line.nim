import strutils

proc parseCsvLine(line: string): seq[string] =
  var cur = ""
  var inQuotes = false
  var i = 0
  while i < line.len:
    let c = line[i]
    if inQuotes:
      if c == '"':
        if i + 1 < line.len and line[i + 1] == '"':
          cur.add('"'); inc i
        else:
          inQuotes = false
      else:
        cur.add(c)
    elif c == '"':
      inQuotes = true
    elif c == ',':
      result.add(cur); cur = ""
    else:
      cur.add(c)
    inc i
  result.add(cur)

for f in parseCsvLine("a,\"b,c\",\"say \"\"hi\"\"\",d"):
  echo "[", f, "]"
