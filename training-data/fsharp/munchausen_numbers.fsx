// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
let isMunchausen (n: int) =
    string n
    |> Seq.map (fun c -> int c - int '0')
    |> Seq.sumBy (fun d -> if d = 0 then 0 else pown d d)
    |> (=) n

[ 1 .. 4999 ] |> List.filter isMunchausen |> List.map string |> String.concat " " |> printfn "%s"
