open System.Collections.Generic

let descendingComparer =
    { new IComparer<int> with
        member _.Compare(a, b) = compare b a }

let sorted = List<int>([ 5; 3; 8; 1; 9 ])
sorted.Sort(descendingComparer)
printfn "%A" (sorted |> List.ofSeq)
