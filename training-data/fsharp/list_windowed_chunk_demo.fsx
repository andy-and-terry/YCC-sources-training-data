let data = [ 1 .. 10 ]

printfn "windowed: %A" (List.windowed 3 data |> List.take 3)
printfn "chunks: %A" (List.chunkBySize 4 data)
printfn "pairwise: %A" (data |> List.pairwise |> List.take 3)

let movingAverage n xs =
    xs |> List.windowed n |> List.map (fun w -> List.averageBy float w)

printfn "moving avg: %A" (movingAverage 3 [ 1; 4; 7; 10; 13 ])

let diffs = data |> List.pairwise |> List.map (fun (a, b) -> b - a)
printfn "diffs: %A" diffs

printfn "partition: %A" (List.partition (fun x -> x > 5) data)
printfn "splitAt: %A" (List.splitAt 3 data)
printfn "transpose: %A" (List.transpose [ [ 1; 2; 3 ]; [ 4; 5; 6 ] ])
printfn "countBy: %A" (List.countBy (fun x -> x % 3) data)
