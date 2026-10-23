// Woodall numbers: W(n) = n * 2^n - 1
let woodall (n: int) : int64 =
    int64 n * (1L <<< n) - 1L

let numbers = [ 1 .. 10 ] |> List.map woodall
printfn "%s" (numbers |> List.map string |> String.concat " ")
