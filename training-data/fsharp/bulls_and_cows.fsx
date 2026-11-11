// Bulls and Cows scoring for equal-length digit strings.
let score (secret: string) (guess: string) =
    let pairs = Seq.zip secret guess |> Seq.toList
    let bulls = pairs |> List.filter (fun (s, g) -> s = g) |> List.length
    let rest = pairs |> List.filter (fun (s, g) -> s <> g)
    let sc = rest |> List.countBy fst |> Map.ofList
    let gc = rest |> List.countBy snd |> Map.ofList
    let cows =
        sc |> Map.fold (fun acc c n -> acc + min n (Map.tryFind c gc |> Option.defaultValue 0)) 0
    bulls, cows

let b, c = score "1807" "7810"
printfn "%d bull(s), %d cow(s)" b c
