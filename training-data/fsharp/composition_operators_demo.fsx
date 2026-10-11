let add1 x = x + 1
let double x = x * 2
let toStr (x: int) = string x

let f = add1 >> double >> toStr
let g = add1 << double << add1

printfn "%s" (f 5)
printfn "%d" (g 5)

let pipeline = [ add1; double; add1 ] |> List.reduce (>>)
printfn "%d" (pipeline 10)

// <| and ||>
printfn "%d" <| double 21
(3, 4) ||> (fun a b -> a * b) |> printfn "%d"
10 |> (fun x -> x - 3) |> printfn "%d"
