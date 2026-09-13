let next_greater_elements nums =
  let n = Array.length nums in
  let result = Array.make n (-1) in
  let stack = ref [] in
  for i = 0 to n - 1 do
    while (match !stack with [] -> false | top :: _ -> nums.(top) < nums.(i)) do
      match !stack with
      | top :: rest ->
          result.(top) <- nums.(i);
          stack := rest
      | [] -> ()
    done;
    stack := i :: !stack
  done;
  result

let () =
  next_greater_elements [| 2; 1; 2; 4; 3 |]
  |> Array.to_list |> List.map string_of_int |> String.concat " " |> print_endline
