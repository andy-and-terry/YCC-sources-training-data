// Count contiguous subarrays whose sum equals k (prefix sums + Map).
let countSubarrays (nums: int list) k =
    let _, _, count =
        nums
        |> List.fold (fun (seen: Map<int, int>, total, count) x ->
            let t = total + x
            let hits = seen |> Map.tryFind (t - k) |> Option.defaultValue 0
            let seen' = seen |> Map.add t ((seen |> Map.tryFind t |> Option.defaultValue 0) + 1)
            seen', t, count + hits) (Map.ofList [ 0, 1 ], 0, 0)
    count

printfn "%d" (countSubarrays [ 1; 1; 1 ] 2)
