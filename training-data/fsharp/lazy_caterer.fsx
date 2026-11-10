let pieces cuts = (cuts * cuts + cuts + 2) / 2

printfn "%s" ([ 0 .. 9 ] |> List.map (pieces >> string) |> String.concat " ") // 1 2 4 7 11 16 22 29 37 46
