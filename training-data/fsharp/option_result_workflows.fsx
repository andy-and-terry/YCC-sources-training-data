let parse (s: string) =
    match System.Int32.TryParse s with
    | true, n -> Some n
    | _ -> None

let safeDiv a b = if b = 0 then Error "div by zero" else Ok(a / b)

let calc a b =
    match parse a, parse b with
    | Some x, Some y -> safeDiv x y
    | _ -> Error "parse failure"

printfn "%A %A %A" (calc "10" "2") (calc "1" "0") (calc "x" "1")
printfn "%A" (Option.map (fun x -> x + 1) (parse "41"))
printfn "%A" (Option.defaultValue 0 (parse "zz"))
printfn "%A" (Result.map (fun x -> x * 2) (Ok 4))
printfn "%A" ([ "1"; "a"; "3" ] |> List.choose parse)
