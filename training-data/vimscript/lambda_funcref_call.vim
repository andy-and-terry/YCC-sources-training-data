let Add = {a, b -> a + b}
let F = function('toupper')
echo Add(1, 2) F('x')
echo call(Add, [10, 20])
