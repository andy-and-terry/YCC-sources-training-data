let divMod a b = a / b, a % b

let q, r = divMod 17 5
printfn "q=%d r=%d" q r

let swap (a, b) = (b, a)
printfn "%A" (swap (1, "one"))

let triple = (1, "two", 3.0)
let (a, b, c) = triple
printfn "%d %s %f" a b c
printfn "%d" (fst (10, 20))
printfn "%d" (snd (10, 20))

let people = [ ("Ana", 31); ("Ben", 25); ("Cy", 40) ]
people |> List.sortBy snd |> printfn "%A"
people |> List.map fst |> printfn "%A"
people |> List.unzip |> printfn "%A"
List.zip [ 1; 2; 3 ] [ "a"; "b"; "c" ] |> printfn "%A"

let struct (x, y) = struct (3, 4)
printfn "%d" (x * y)
printfn "%b" ((1, 2) = (1, 2))
