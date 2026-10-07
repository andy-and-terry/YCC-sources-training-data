let encode chars =
  let rec go acc = function
    | [] -> List.rev acc
    | c :: rest ->
        let rec count_run n = function
          | c' :: rest' when c' = c -> count_run (n + 1) rest'
          | remaining -> (n, remaining)
        in
        let n, remaining = count_run 1 rest in
        go ((n, c) :: acc) remaining
  in
  go [] chars

let decode pairs = List.concat_map (fun (n, c) -> List.init n (fun _ -> c)) pairs

let () =
  let input = [ 'a'; 'a'; 'a'; 'b'; 'b'; 'c'; 'a'; 'a' ] in
  let encoded = encode input in
  List.iter (fun (n, c) -> Printf.printf "%d%c" n c) encoded;
  print_newline ();
  decode encoded |> List.iter print_char;
  print_newline ()
