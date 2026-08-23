let minCoins (coins: int list) (amount: int) =
    let table = Array.create (amount + 1) None
    table.[0] <- Some 0
    for n in 1 .. amount do
        let options =
            coins
            |> List.filter (fun c -> c <= n)
            |> List.choose (fun c -> table.[n - c])
        table.[n] <- if options.IsEmpty then None else Some (List.min options + 1)
    table.[amount]

printfn "%A" (minCoins [ 1; 2; 5 ] 11)
