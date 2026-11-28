let modInverse a m = [ 1 .. m - 1 ] |> List.find (fun x -> a * x % m = 1)

let affine (s: string) a b decrypt =
    let inv = modInverse a 26
    s
    |> String.map (fun ch ->
        if System.Char.IsUpper ch then
            let x = int ch - 65
            let y = if decrypt then ((inv * (x - b)) % 26 + 26) % 26 else (a * x + b) % 26
            char (y + 65)
        else ch)

let c = affine "AFFINE" 5 8 false
printfn "%s %s" c (affine c 5 8 true)
