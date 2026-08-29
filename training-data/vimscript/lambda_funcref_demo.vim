function! MyAdd(a, b)
  return a:a + a:b
endfunction

let Square = {x -> x * x}
let numbers = [1, 2, 3, 4, 5]
let squares = map(copy(numbers), {_, v -> v * v})
echo squares
echo Square(6)

let Add = function('MyAdd')
echo Add(3, 4)
