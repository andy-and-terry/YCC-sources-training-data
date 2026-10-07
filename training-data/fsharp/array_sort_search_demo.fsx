let data = [| 5; 3; 9; 1; 7 |]

let sorted = Array.sort data
printfn "%A" sorted
printfn "%A" (Array.sortDescending data)
printfn "%A" (Array.sortBy (fun x -> abs (x - 5)) data)
printfn "%A" (Array.sortWith (fun a b -> compare b a) data)
printfn "%A" (Array.tryFind (fun x -> x > 6) data)
printfn "%A" (Array.tryFindIndex ((=) 9) data)
printfn "%d" (Array.BinarySearch(sorted, 7))
printfn "%A" (Array.partition (fun x -> x % 2 = 1) data)
printfn "%A" (Array.chunkBySize 2 data)
printfn "%A" (Array.windowed 3 data)
printfn "%A" (Array.zip data sorted |> Array.take 2)
