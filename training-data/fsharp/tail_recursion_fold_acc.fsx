let rec sumTo acc n = if n = 0 then acc else sumTo (acc + n) (n - 1)
printfn "%d" (sumTo 0 100000)
printfn "%d" (List.fold (fun a x -> a * 2 + x) 0 [ 1; 0; 1; 1 ])
