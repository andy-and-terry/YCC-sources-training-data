let twoSum (nums: int list) target =
    let rec go items index (seen: Map<int, int>) =
        match items with
        | [] -> None
        | n :: rest ->
            let complement = target - n
            match Map.tryFind complement seen with
            | Some j -> Some (j, index)
            | None -> go rest (index + 1) (Map.add n index seen)
    go nums 0 Map.empty

printfn "%A" (twoSum [ 2; 7; 11; 15 ] 9)
