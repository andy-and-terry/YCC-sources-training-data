open System

let swapCase (s: string) =
    s |> String.map (fun c -> if Char.IsUpper c then Char.ToLower c else Char.ToUpper c)

printfn "%s" (swapCase "Hello World 42")
