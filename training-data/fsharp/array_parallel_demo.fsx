let numbers = [| 1 .. 100_000 |]

let isPrime n =
    n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let primeFlags = numbers |> Array.Parallel.map isPrime
printfn "primes: %d" (primeFlags |> Array.filter id |> Array.length)

let squares = Array.Parallel.init 8 (fun i -> i * i)
printfn "%A" squares

let sumOfSquares =
    numbers |> Array.Parallel.map (fun x -> int64 x * int64 x) |> Array.sum
printfn "%d" sumOfSquares

let evens = numbers |> Array.Parallel.choose (fun x -> if x % 20000 = 0 then Some x else None)
printfn "%A" evens

Array.Parallel.iter (fun _ -> ()) numbers
let sorted = [| 5; 2; 9; 1 |] |> Array.sort
printfn "%A" sorted
