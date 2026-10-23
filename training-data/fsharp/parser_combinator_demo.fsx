// A tiny parser-combinator library: a parser is a function from input to a result.
type Parser<'a> = char list -> ('a * char list) option

let satisfy pred : Parser<char> = function
    | c :: rest when pred c -> Some(c, rest)
    | _ -> None

let map f (p: Parser<'a>) : Parser<'b> =
    fun input -> p input |> Option.map (fun (v, rest) -> f v, rest)

let andThen (p1: Parser<'a>) (p2: Parser<'b>) : Parser<'a * 'b> =
    fun input ->
        match p1 input with
        | Some(a, rest) ->
            match p2 rest with
            | Some(b, rest2) -> Some((a, b), rest2)
            | None -> None
        | None -> None

let rec many (p: Parser<'a>) : Parser<'a list> =
    fun input ->
        match p input with
        | Some(v, rest) ->
            let (vs, rest2) = (many p rest).Value
            Some(v :: vs, rest2)
        | None -> Some([], input)

let digit = satisfy System.Char.IsDigit
let number = many digit |> map (fun ds -> ds |> List.toArray |> System.String |> int)
let pair = andThen number (andThen (satisfy ((=) ',')) number)

printfn "%A" (number (List.ofSeq "123abc"))
printfn "%A" (pair (List.ofSeq "12,34!") |> Option.map fst)
