type json =
  | JNull
  | JBool of bool
  | JNumber of float
  | JString of string
  | JArray of json list
  | JObject of (string * json) list

let rec to_string = function
  | JNull -> "null"
  | JBool b -> string_of_bool b
  | JNumber n -> string_of_float n
  | JString s -> Printf.sprintf "\"%s\"" s
  | JArray items -> "[" ^ String.concat "," (List.map to_string items) ^ "]"
  | JObject fields ->
      "{"
      ^ String.concat "," (List.map (fun (k, v) -> Printf.sprintf "\"%s\":%s" k (to_string v)) fields)
      ^ "}"

let () =
  let doc =
    JObject
      [ ("name", JString "Ada"); ("age", JNumber 30.0); ("active", JBool true);
        ("tags", JArray [ JString "math"; JString "cs" ]) ]
  in
  print_endline (to_string doc)
