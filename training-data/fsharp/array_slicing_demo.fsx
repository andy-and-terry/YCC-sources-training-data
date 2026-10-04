let arr = [| 10; 20; 30; 40; 50; 60 |]

printfn "%A" arr.[1..3]
printfn "%A" arr.[..2]
printfn "%A" arr.[4..]
printfn "%A" arr.[arr.Length - 2 ..]

let copy = Array.copy arr
copy.[0] <- 99
printfn "%d %d" arr.[0] copy.[0]

let matrix = Array2D.init 3 3 (fun i j -> i * 3 + j)
printfn "%A" matrix.[1, *]
printfn "%A" matrix.[*, 2]
printfn "%A" matrix.[0..1, 0..1]

printfn "%A" (Array.sub arr 2 3)
printfn "%A" (Array.rev arr)
