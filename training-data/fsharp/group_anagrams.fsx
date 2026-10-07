let groupAnagrams (words: string list) =
    words
    |> List.groupBy (fun w -> w |> Seq.sort |> Seq.toArray |> System.String)
    |> List.map snd

printfn "%A" (groupAnagrams [ "eat"; "tea"; "tan"; "ate"; "nat"; "bat" ])
