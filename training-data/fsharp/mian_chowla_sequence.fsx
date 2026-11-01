// Greedy sequence whose pairwise sums are all distinct.
let mianChowla count =
    let rec go cand (seq: int list) (sums: Set<int>) =
        if List.length seq = count then seq
        else
            let fresh = (seq @ [ cand ]) |> List.map ((+) cand)
            let freshSet = Set.ofList fresh
            if freshSet.Count = fresh.Length && Set.isEmpty (Set.intersect freshSet sums) then
                go (cand + 1) (seq @ [ cand ]) (Set.union sums freshSet)
            else
                go (cand + 1) seq sums
    go 1 [] Set.empty

mianChowla 8 |> List.map string |> String.concat " " |> printfn "%s"
