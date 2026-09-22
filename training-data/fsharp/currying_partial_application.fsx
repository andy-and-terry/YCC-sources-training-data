let add3 a b c = a + b + c

let addToTen = add3 10
let addToTwenty = addToTen 10

printfn "%d" (add3 1 2 3)
printfn "%d" (addToTen 5 6)
printfn "%d" (addToTwenty 7)

let multiplyBy factor x = factor * x
let double = multiplyBy 2
let triple = multiplyBy 3

[ 1; 2; 3; 4 ]
|> List.map double
|> printfn "%A"

[ 1; 2; 3; 4 ]
|> List.map triple
|> printfn "%A"
