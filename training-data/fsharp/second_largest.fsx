let secondLargest (nums: int list) =
    let largest, second =
        if nums.[0] > nums.[1] then nums.[0], nums.[1] else nums.[1], nums.[0]

    nums
    |> List.skip 2
    |> List.fold
        (fun (largest, second) n ->
            if n > largest then n, largest
            elif n > second then largest, n
            else largest, second)
        (largest, second)
    |> snd

printfn "%d" (secondLargest [ 12; 35; 1; 10; 34; 1 ])
