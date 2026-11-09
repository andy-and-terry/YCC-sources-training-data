vim9script

def Square(x: number): number
  return x * x
enddef

var xs: list<number> = [1, 2, 3]
echo xs->map((_, v) => Square(v))
