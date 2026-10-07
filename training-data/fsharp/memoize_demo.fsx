open System.Collections.Generic

let memoize f =
    let cache = Dictionary<_, _>()
    fun x ->
        match cache.TryGetValue x with
        | true, v -> v
        | _ ->
            let v = f x
            cache.[x] <- v
            v

let rec fib =
    memoize (fun n ->
        if n < 2 then bigint n
        else fib (n - 1) + fib (n - 2))

printfn "fib 30 = %A" (fib 30)
printfn "fib 90 = %A" (fib 90)
