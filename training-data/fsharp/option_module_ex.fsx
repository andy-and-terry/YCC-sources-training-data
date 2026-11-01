let tryFind k m = Map.tryFind k m
let m = Map.ofList [ "a", 1; "b", 2 ]

printfn "%A" (tryFind "a" m |> Option.map ((+) 10))
printfn "%d" (tryFind "z" m |> Option.defaultValue -1)
printfn "%A" ([ Some 1; None; Some 3 ] |> List.choose id)
