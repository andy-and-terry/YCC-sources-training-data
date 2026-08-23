let wordFrequency (text: string) =
    text.ToLower().Split(' ')
    |> Array.fold
        (fun (acc: Map<string, int>) word ->
            let count = defaultArg (Map.tryFind word acc) 0
            Map.add word (count + 1) acc)
        Map.empty

printfn "%A" (wordFrequency "the quick brown fox the lazy fox")
