let items = ResizeArray<string>()
items.Add "one"
items.Add "two"
items.AddRange [ "three"; "four" ]
items.Insert(1, "one-and-a-half")

printfn "%d items" items.Count
printfn "%s" items.[2]
printfn "%A" (Seq.toList items)

items.Remove "two" |> ignore
items.RemoveAt 0
printfn "%A" (Seq.toList items)

items.Sort()
printfn "%A" (items.ToArray())
printfn "%d" (items.FindIndex(fun s -> s.StartsWith "t"))
printfn "%b" (items.Exists(fun s -> s.Length > 10))
items.Reverse()
printfn "%s" (String.concat "," items)
