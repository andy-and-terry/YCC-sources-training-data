let rec fact n = if n <= 1I then 1I else n * fact (n - 1I)
let fib n =
    let rec go a b i = if i = 0 then a else go b (a + b) (i - 1)
    go 0I 1I n
let rec sumTo n acc = if n = 0 then acc else sumTo (n - 1) (acc + n)

printfn "%A %A %d" (fact 25I) (fib 100) (sumTo 1000000 0)

let memoize f =
    let cache = System.Collections.Generic.Dictionary<_, _>()
    fun x ->
        match cache.TryGetValue x with
        | true, v -> v
        | _ ->
            let v = f x
            cache.[x] <- v
            v

let slowSquare = memoize (fun x -> printfn "computing %d" x; x * x)
printfn "%d %d" (slowSquare 4) (slowSquare 4)
