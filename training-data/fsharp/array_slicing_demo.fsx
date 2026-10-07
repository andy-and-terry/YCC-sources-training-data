let xs = [| 10; 20; 30; 40; 50; 60 |]

printfn "%A" xs.[1..3]
printfn "%A" xs.[..2]
printfn "%A" xs.[4..]
printfn "%A" xs.[^1]
printfn "%A" xs.[^2..]

let grid = Array2D.init 3 3 (fun r c -> r * 3 + c)
printfn "%A" grid.[0.., 1]
printfn "%A" grid.[1, *]

let arr = Array.copy xs
arr.[1..2] <- [| 0; 0 |]
printfn "%A" arr

printfn "%A" (Array.sub xs 2 3)
printfn "%A" (Array.chunkBySize 4 xs)
printfn "%A" (Array.windowed 2 xs |> Array.map (fun w -> w.[1] - w.[0]))
printfn "%A" ("hello".[1..3])
