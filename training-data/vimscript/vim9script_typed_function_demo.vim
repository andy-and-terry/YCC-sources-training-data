vim9script

def Square(n: number): number
  return n * n
enddef

def SumList(nums: list<number>): number
  var total = 0
  for n in nums
    total += n
  endfor
  return total
enddef

echo Square(6)
echo SumList([1, 2, 3, 4, 5])

var Add = (a: number, b: number): number => a + b
echo Add(3, 4)
