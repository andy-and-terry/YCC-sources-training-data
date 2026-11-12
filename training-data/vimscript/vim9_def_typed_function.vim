vim9script
def Sum(xs: list<number>): number
  var t = 0
  for x in xs | t += x | endfor
  return t
enddef
echo Sum([1, 2, 3])
