let fibonacci n =
    let cache = System.Collections.Generic.Dictionary<int, int64>()
    let rec go n =
        if n < 2 then int64 n
        else
            match cache.TryGetValue n with
            | true, v -> v
            | false, _ ->
                let result = go (n - 1) + go (n - 2)
                cache.[n] <- result
                result
    go n

[ 0 .. 9 ] |> List.map fibonacci |> printfn "%A"
