let add1 x = x + 1
let dbl x = x * 2
let composed = add1 >> dbl
let backward = add1 << dbl

[ 1 .. 10 ]
|> List.filter (fun x -> x % 2 = 0)
|> List.map (fun x -> x * x)
|> List.sum
|> printfn "%d"

printfn "%d %d" (composed 5) (backward 5)
let curried a b c = a + b * c
let partial = curried 1 2
printfn "%d" (partial 10)
"hello world" |> String.length |> printfn "%d"
