let data = [| 1 .. 1000 |]

let squares = data |> Array.Parallel.map (fun x -> x * x)
printfn "sum of squares: %d" (Array.sum squares)

let evens = data |> Array.Parallel.filter (fun x -> x % 2 = 0)
printfn "evens: %d" evens.Length

let total = data |> Array.Parallel.sumBy (fun x -> int64 x)
printfn "total: %d" total

Array.Parallel.init 5 (fun i -> i * 10) |> printfn "%A"
