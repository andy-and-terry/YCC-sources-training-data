let squares = Array.init 6 (fun i -> i * i)
printfn "%A" squares

let indexed = Array.mapi (fun i x -> i + x) squares
printfn "%A" indexed

let dst = Array.zeroCreate<int> 10
Array.blit squares 1 dst 3 4
printfn "%A" dst

let filled = Array.create 4 'x'
printfn "%s" (System.String filled)

Array.fill dst 0 3 -1
printfn "%A" dst
printfn "%A" (Array.sub squares 2 3)
printfn "%A" (Array.append [| 1; 2 |] [| 3 |])
