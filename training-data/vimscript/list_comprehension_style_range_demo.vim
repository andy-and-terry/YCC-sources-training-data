let squares = map(range(1, 10), {_, n -> n * n})
echo squares

let evens = filter(copy(squares), {_, n -> n % 2 == 0})
echo evens

let pairs = map(range(3), {i, _ -> [i, i * 2]})
echo pairs

echo range(10, 0, -3)
echo reduce(range(1, 5), {acc, n -> acc * n}, 1)
echo join(map(range(65, 70), {_, n -> nr2char(n)}), '')
