let names = ["Ann"; "Bob"; "Cy"]
let ages = [31; 25; 47]
let cities = ["Oslo"; "Rome"; "Lima"]

List.zip3 names ages cities
|> List.iter (fun (n, a, c) -> printfn "%s (%d) lives in %s" n a c)

let (ns, ags, cs) = List.zip3 names ages cities |> List.unzip3
printfn "%A %A %A" ns ags cs
