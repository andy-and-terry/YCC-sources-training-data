// Classify numbers as perfect, abundant or deficient using a discriminated union.

type Classification =
    | Perfect
    | Abundant
    | Deficient

let aliquotSum n =
    if n < 2 then 0
    else
        seq { 1 .. int (sqrt (float n)) }
        |> Seq.filter (fun d -> n % d = 0)
        |> Seq.collect (fun d -> if d = n / d || d = 1 then [ d ] else [ d; n / d ])
        |> Seq.sum

let classify n =
    match compare (aliquotSum n) n with
    | 0 -> Perfect
    | c when c > 0 -> Abundant
    | _ -> Deficient

[ 6; 12; 15; 28; 496 ]
|> List.iter (fun n -> printfn "%d: %A" n (classify n))

let perfects =
    [ 2 .. 10000 ] |> List.filter (fun n -> classify n = Perfect)

printfn "Perfect numbers up to 10000: %A" perfects
