let xs = [ 3; 1; 4; 1; 5 ]
printfn "%A" (List.scan (+) 0 xs)
printfn "%d" (List.fold (fun acc x -> acc * 10 + x) 0 xs)
