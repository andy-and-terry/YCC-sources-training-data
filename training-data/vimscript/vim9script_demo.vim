vim9script

def Fibonacci(n: number): number
  var a = 0
  var b = 1
  for _ in range(n)
    [a, b] = [b, a + b]
  endfor
  return a
enddef

def IsEven(n: number): bool
  return n % 2 == 0
enddef

var results: list<number> = []
for i in range(10)
  add(results, Fibonacci(i))
endfor

echo results
echo IsEven(4)
echo IsEven(7)
