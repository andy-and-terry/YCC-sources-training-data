let knapsack (items: (int * int) list) capacity =
    let dp = Array.create (capacity + 1) 0
    for (weight, value) in items do
        for cap in capacity .. -1 .. weight do
            dp.[cap] <- max dp.[cap] (dp.[cap - weight] + value)
    dp.[capacity]

printfn "%d" (knapsack [ (2, 3); (3, 4); (4, 5); (5, 6) ] 5)
