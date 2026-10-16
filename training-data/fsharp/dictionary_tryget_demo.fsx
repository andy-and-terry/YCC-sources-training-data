open System.Collections.Generic

let stock = Dictionary<string, int>()
stock.["apple"] <- 5
stock.Add("pear", 2)

match stock.TryGetValue "apple" with
| true, n -> printfn "apple: %d" n
| _ -> printfn "no apple"

match stock.TryGetValue "plum" with
| true, n -> printfn "plum: %d" n
| _ -> printfn "no plum"

let addStock key n =
    match stock.TryGetValue key with
    | true, cur -> stock.[key] <- cur + n
    | _ -> stock.[key] <- n

addStock "apple" 10
addStock "plum" 1

for KeyValue (k, v) in stock |> Seq.sortBy (fun kv -> kv.Key) do
    printfn "%s = %d" k v
printfn "%b" (stock.ContainsKey "pear")
stock.Remove "pear" |> ignore
printfn "%d keys" stock.Count
