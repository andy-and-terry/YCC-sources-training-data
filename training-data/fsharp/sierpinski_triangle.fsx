let n = 8
for r in 0 .. n - 1 do
    let row = [ for c in 0 .. r -> if r &&& c = c then "* " else "  " ] |> String.concat ""
    printfn "%s%s" (String.replicate (n - r - 1) " ") row
