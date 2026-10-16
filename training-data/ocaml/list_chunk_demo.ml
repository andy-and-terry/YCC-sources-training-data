let chunk size lst =
  let rec go acc cur n = function
    | [] -> List.rev (if cur = [] then acc else List.rev cur :: acc)
    | x :: rest ->
        if n = size then go (List.rev cur :: acc) [ x ] 1 rest
        else go acc (x :: cur) (n + 1) rest
  in
  go [] [] 0 lst

let () =
  let groups = chunk 3 [ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ] in
  List.iter
    (fun g -> print_endline ("[" ^ String.concat "; " (List.map string_of_int g) ^ "]"))
    groups
