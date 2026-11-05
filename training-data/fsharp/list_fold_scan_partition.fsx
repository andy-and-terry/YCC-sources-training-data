let xs = [ 1 .. 6 ]
printfn "%A" (List.fold (+) 0 xs)
printfn "%A" (List.scan (+) 0 xs)
printfn "%A" (List.partition (fun x -> x > 3) xs)
printfn "%A" (List.windowed 2 xs)
