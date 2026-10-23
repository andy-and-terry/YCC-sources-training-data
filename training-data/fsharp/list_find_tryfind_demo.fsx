let nums = [ 3; 8; 12; 5 ]

printfn "%d" (List.find (fun n -> n > 5) nums)
printfn "%A" (List.tryFind (fun n -> n > 100) nums)
printfn "%d" (List.findIndex (fun n -> n = 12) nums)
printfn "%A" (List.tryFindIndex (fun n -> n = 99) nums)
printfn "%A" (List.tryPick (fun n -> if n % 4 = 0 then Some(n * n) else None) nums)

try
    List.find (fun n -> n > 100) nums |> ignore
with :? System.Collections.Generic.KeyNotFoundException ->
    printfn "not found"
