let ages =
    Map.empty
    |> Map.add "Alice" 30
    |> Map.add "Bob" 25
    |> Map.add "Carol" 35

printfn "%A" (Map.tryFind "Bob" ages)
printfn "%A" (Map.tryFind "Dave" ages)

let older = ages |> Map.map (fun _ age -> age + 1)
printfn "%A" older

let dict = System.Collections.Generic.Dictionary<string, int>()
dict.["x"] <- 1
dict.["y"] <- 2
let ok, value = dict.TryGetValue("x")
printfn "%b %d" ok value
