let xs = [ 1; 2; 3; 4 ]

// foldBack processes from the right
printfn "%s" (List.foldBack (fun x acc -> sprintf "(%d %s)" x acc) xs "nil")
printfn "%s" (List.fold (fun acc x -> sprintf "(%s %d)" acc x) "nil" xs)

printfn "%d" (List.reduce (-) xs)
printfn "%d" (List.reduceBack (-) xs)

printfn "%A" (List.scan (+) 0 xs)
printfn "%A" (List.scanBack (+) xs 0)
printfn "%d" (List.fold max System.Int32.MinValue xs)
