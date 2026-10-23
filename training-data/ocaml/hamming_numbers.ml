(* Hamming numbers (5-smooth): only prime factors 2, 3 and 5 *)
let rec strip n p = if n mod p = 0 then strip (n / p) p else n

let is_hamming n = strip (strip (strip n 2) 3) 5 = 1

let () =
  let rec take count n acc =
    if count = 0 then List.rev acc
    else if is_hamming n then take (count - 1) (n + 1) (n :: acc)
    else take count (n + 1) acc
  in
  print_endline (String.concat " " (List.map string_of_int (take 20 1 [])))
