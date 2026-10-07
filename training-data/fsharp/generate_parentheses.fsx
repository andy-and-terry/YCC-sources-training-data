let rec backtrack current openCount closeCount maxN =
    if String.length current = maxN * 2 then
        [ current ]
    else
        let withOpen =
            if openCount < maxN then backtrack (current + "(") (openCount + 1) closeCount maxN
            else []

        let withClose =
            if closeCount < openCount then backtrack (current + ")") openCount (closeCount + 1) maxN
            else []

        withOpen @ withClose

let generate n = backtrack "" 0 0 n

printfn "%A" (generate 3)
