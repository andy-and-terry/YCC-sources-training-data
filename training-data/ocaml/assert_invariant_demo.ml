(* assert for invariants, with Assert_failure caught and printed *)
let safe_div a b =
  assert (b <> 0);
  a / b

let sorted_insert x lst =
  let rec go = function
    | [] -> [ x ]
    | h :: t as l -> if x <= h then x :: l else h :: go t
  in
  let result = go lst in
  assert (List.length result = List.length lst + 1);
  result

let () =
  Printf.printf "10 / 2 = %d\n" (safe_div 10 2);
  (try ignore (safe_div 1 0)
   with Assert_failure (_file, _line, _col) -> print_endline "assertion failed: divisor was zero");
  let l = sorted_insert 3 [ 1; 2; 4; 5 ] in
  print_endline (String.concat "," (List.map string_of_int l));
  (try failwith "boom"
   with e -> Printf.printf "caught: %s\n" (Printexc.to_string e))
