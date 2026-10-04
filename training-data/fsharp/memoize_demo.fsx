open System.Collections.Generic

let memoize (f: 'a -> 'b) : 'a -> 'b =
    let cache = Dictionary<'a, 'b>()
    fun x ->
        match cache.TryGetValue x with
        | true, v -> v
        | _ ->
            let v = f x
            cache.[x] <- v
            v

let slowSquare x =
    printfn "computing %d" x
    x * x

let fastSquare = memoize slowSquare
printfn "%d" (fastSquare 9)
printfn "%d" (fastSquare 9)
printfn "%d" (fastSquare 4)

let rec fib =
    memoize (fun n -> if n < 2 then bigint n else fib (n - 1) + fib (n - 2))

printfn "%A" (fib 90)
