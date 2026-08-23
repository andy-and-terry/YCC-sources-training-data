let is_armstrong n =
  let digits_str = string_of_int n in
  let power = String.length digits_str in
  let total =
    String.to_seq digits_str
    |> Seq.map (fun c -> int_of_char c - int_of_char '0')
    |> Seq.fold_left (fun acc d -> acc + int_of_float (float_of_int d ** float_of_int power)) 0
  in
  total = n

let () =
  print_endline (string_of_bool (is_armstrong 153));
  print_endline (string_of_bool (is_armstrong 154))
