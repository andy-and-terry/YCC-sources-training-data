type RangeSum(values: int list) =
    let prefix = List.scan (+) 0 values |> Array.ofList
    member _.Query(lo: int, hi: int) = prefix.[hi] - prefix.[lo]

printfn "%d" (RangeSum([ 3; 1; 4; 1; 5; 9; 2; 6 ]).Query(2, 5))
