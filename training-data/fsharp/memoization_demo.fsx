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
        if n < 2L then n else fib (n - 1L) + fib (n - 2L))

printfn "%d" (fib 50L)
printfn "%d" (fib 80L)
