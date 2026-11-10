let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n >= 2 && go 2

let rev n = int_of_string (String.init (String.length (string_of_int n))
  (fun i -> let s = string_of_int n in s.[String.length s - 1 - i]))

let () =
  let rec collect n left acc =
    if left = 0 then List.rev acc
    else
      let r = rev n in
      if r <> n && is_prime n && is_prime r then collect (n + 1) (left - 1) (n :: acc)
      else collect (n + 1) left acc
  in
  print_endline (String.concat " " (List.map string_of_int (collect 2 10 [])))
  (* 13 17 31 37 71 73 79 97 107 113 *)
