let words = [ "pear"; "fig"; "banana"; "kiwi"; "apple" ]

printfn "%A" (List.sort words)
printfn "%A" (List.sortDescending words)
printfn "%A" (List.sortBy String.length words)
printfn "%A" (List.sortByDescending String.length words)

// sortWith: by length, then alphabetically
let cmp (a: string) (b: string) =
    match compare a.Length b.Length with
    | 0 -> compare a b
    | n -> n

printfn "%A" (List.sortWith cmp words)
printfn "%A" (List.rev (List.sort words))
