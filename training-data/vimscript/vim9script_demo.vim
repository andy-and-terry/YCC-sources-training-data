vim9script

# Vim9script idioms: typed def functions, var/const declarations, typed
# list<T> annotations, and the -> free arrow lambda syntax, contrasted with
# the legacy function!/a: style used by the rest of this folder.

def Factorial(n: number): number
  var result = 1
  for i in range(2, n)
    result *= i
  endfor
  return result
enddef

def FilterEven(nums: list<number>): list<number>
  return filter(nums->copy(), (_, v) => v % 2 == 0)
enddef

const NUMS: list<number> = [1, 2, 3, 4, 5, 6, 7, 8]

echo Factorial(5)
echo FilterEven(NUMS)
