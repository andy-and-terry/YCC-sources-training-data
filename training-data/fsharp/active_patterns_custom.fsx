let (|Even|Odd|) n = if n % 2 = 0 then Even else Odd

let (|Prefix|_|) (p: string) (s: string) = if s.StartsWith p then Some(s.Substring p.Length) else None

let describe n =
    match n with
    | Even -> "even"
    | Odd -> "odd"

let cmd s =
    match s with
    | Prefix "add " rest -> sprintf "adding %s" rest
    | Prefix "del " rest -> sprintf "deleting %s" rest
    | _ -> "unknown"

printfn "%s %s" (describe 4) (describe 7)
printfn "%s | %s | %s" (cmd "add milk") (cmd "del eggs") (cmd "zzz")
