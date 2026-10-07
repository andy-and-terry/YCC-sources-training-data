let (|Prefix|_|) (prefix: string) (s: string) =
    if s.StartsWith(prefix) then Some(s.Substring(prefix.Length)) else None

let (|Suffix|_|) (suffix: string) (s: string) =
    if s.EndsWith(suffix) then Some(s.Substring(0, s.Length - suffix.Length)) else None

let classify s =
    match s with
    | Prefix "http://" rest -> sprintf "insecure url to %s" rest
    | Prefix "https://" rest -> sprintf "secure url to %s" rest
    | Suffix ".fsx" name -> sprintf "F# script named %s" name
    | _ -> sprintf "unrecognized: %s" s

[ "https://example.com"; "http://example.com"; "program.fsx"; "readme.txt" ]
|> List.map classify
|> List.iter (printfn "%s")
