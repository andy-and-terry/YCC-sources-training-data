let equilibriumIndex (nums: int list) =
    let total = List.sum nums
    let prefix = List.scan (+) 0 nums
    List.zip prefix nums
    |> List.tryFindIndex (fun (left, v) -> left = total - left - v)

printfn "%A" (equilibriumIndex [ 1; 7; 3; 6; 5; 6 ]) // Some 3
