let countVowels (s: string) =
    s.ToLower()
    |> Seq.filter (fun c -> "aeiou".Contains c)
    |> Seq.countBy id
    |> Seq.sortBy fst
    |> List.ofSeq

printfn "%A" (countVowels "Education is beautiful")
