type Json =
    | JNull
    | JBool of bool
    | JNumber of float
    | JString of string
    | JArray of Json list
    | JObject of (string * Json) list

let rec serialize json =
    match json with
    | JNull -> "null"
    | JBool b -> if b then "true" else "false"
    | JNumber n -> string n
    | JString s -> sprintf "\"%s\"" s
    | JArray items -> items |> List.map serialize |> String.concat ", " |> sprintf "[%s]"
    | JObject fields ->
        fields
        |> List.map (fun (k, v) -> sprintf "\"%s\": %s" k (serialize v))
        |> String.concat ", "
        |> sprintf "{%s}"

let doc =
    JObject
        [ "name", JString "Alice"
          "age", JNumber 30.0
          "active", JBool true
          "tags", JArray [ JString "admin"; JString "user" ]
          "note", JNull ]

printfn "%s" (serialize doc)
