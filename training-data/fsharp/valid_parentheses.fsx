let isValid (s: string) =
    let pairs = dict [ ')', '('; ']', '['; '}', '{' ]
    let rec go chars stack =
        match chars with
        | [] -> List.isEmpty stack
        | c :: rest when c = '(' || c = '[' || c = '{' -> go rest (c :: stack)
        | c :: rest when pairs.ContainsKey c ->
            match stack with
            | top :: stackRest when top = pairs.[c] -> go rest stackRest
            | _ -> false
        | _ :: rest -> go rest stack
    go (List.ofSeq s) []

printfn "%b" (isValid "{[()]}")
printfn "%b" (isValid "{[(])}")
