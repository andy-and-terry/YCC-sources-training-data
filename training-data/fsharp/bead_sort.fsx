// Bead (gravity) sort.
let beadSort (nums: int list) =
    let cols = [ for i in 1 .. List.max nums -> nums |> List.filter (fun n -> n >= i) |> List.length ]
    [ for r in 1 .. nums.Length -> cols |> List.filter (fun c -> c >= r) |> List.length ] |> List.rev

printfn "%A" (beadSort [5; 3; 1; 4; 2])
