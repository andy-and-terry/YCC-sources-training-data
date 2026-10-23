// Cullen numbers: C(n) = n * 2^n + 1
let cullen (n: int) : int64 =
    int64 n * (1L <<< n) + 1L

let numbers = [ 0 .. 9 ] |> List.map cullen
printfn "%s" (numbers |> List.map string |> String.concat " ")
