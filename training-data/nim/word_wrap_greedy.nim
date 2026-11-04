import strutils

proc wrap(text: string, width: int): seq[string] =
  var line = ""
  for word in text.splitWhitespace():
    if line.len > 0 and line.len + 1 + word.len > width:
      result.add line
      line = word
    else:
      line = if line.len == 0: word else: line & " " & word
  if line.len > 0: result.add line

for l in wrap("the quick brown fox jumps over the lazy dog", 15):
  echo "|", l.alignLeft(15), "|"
