// Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
// Fibonacci numbers up to n, largest first.
let fibsUpTo (n: int) : int list =
    let rec loop a b acc =
        if a > n then acc else loop b (a + b) (a :: acc)
    loop 1 2 []

let zeckendorf (n: int) : int list =
    let step (rest, parts) f =
        if f <= rest then (rest - f, f :: parts) else (rest, parts)
    let _, parts = List.fold step (n, []) (fibsUpTo n)
    List.rev parts

printfn "%s" (zeckendorf 100 |> List.map string |> String.concat " ")
