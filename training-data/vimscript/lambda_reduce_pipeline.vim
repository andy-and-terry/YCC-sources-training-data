let Double = {x -> x * 2}
let Inc = {x -> x + 1}
let Square = {x -> x * x}

let pipeline = [Double, Inc, Square]

" reduce() folds the value through each Funcref in turn: ((3*2)+1)^2 = 49
let result = reduce(pipeline, {acc, Fn -> Fn(acc)}, 3)
echo result

let words = ['abc', 'de', 'fghi']
let total_len = reduce(map(copy(words), {_, v -> len(v)}), {acc, n -> acc + n}, 0)
echo total_len
