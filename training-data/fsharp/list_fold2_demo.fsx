// fold2 walks two lists of equal length in lock step
let dot xs ys = List.fold2 (fun acc x y -> acc + x * y) 0 xs ys

printfn "%d" (dot [1; 2; 3] [4; 5; 6])

let weightedAverage values weights =
    let total = List.fold2 (fun acc v w -> acc + v * w) 0.0 values weights
    total / List.sum weights

printfn "%.2f" (weightedAverage [80.0; 90.0; 70.0] [1.0; 2.0; 1.0])
