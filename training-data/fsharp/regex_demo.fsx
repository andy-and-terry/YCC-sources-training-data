open System.Text.RegularExpressions

let datePattern = Regex(@"(?<y>\d{4})-(?<m>\d{2})-(?<d>\d{2})")
let m = datePattern.Match "Released 2024-05-17 today"

if m.Success then
    printfn "year=%s month=%s day=%s" m.Groups.["y"].Value m.Groups.["m"].Value m.Groups.["d"].Value

let (|Regexp|_|) pattern input =
    let r = Regex.Match(input, pattern)
    if r.Success then Some [ for g in r.Groups -> g.Value ] else None

for s in [ "age: 42"; "name: ada"; "???" ] do
    match s with
    | Regexp @"^age: (\d+)$" [ _; n ] -> printfn "age %s" n
    | Regexp @"^name: (\w+)$" [ _; n ] -> printfn "name %s" n
    | _ -> printfn "no match: %s" s

printfn "%s" (Regex.Replace("a1b22c333", @"\d+", fun mt -> sprintf "<%d>" mt.Length))
printfn "%A" (Regex.Split("one, two;three", @"[,;]\s*"))
printfn "%A" [ for x in Regex.Matches("cat bat rat", @"\b\wat\b") -> x.Value ]
printfn "%b" (Regex.IsMatch("hello", "^h.*o$"))
