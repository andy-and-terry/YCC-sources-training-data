let mat_mult a b =
  [| [| (a.(0).(0) * b.(0).(0)) + (a.(0).(1) * b.(1).(0));
        (a.(0).(0) * b.(0).(1)) + (a.(0).(1) * b.(1).(1)) |];
     [| (a.(1).(0) * b.(0).(0)) + (a.(1).(1) * b.(1).(0));
        (a.(1).(0) * b.(0).(1)) + (a.(1).(1) * b.(1).(1)) |] |]

let rec mat_pow m n =
  if n = 1 then m
  else
    let half = mat_pow m (n / 2) in
    let squared = mat_mult half half in
    if n mod 2 = 0 then squared else mat_mult squared m

let fibonacci n =
  if n = 0 then 0
  else
    let result = mat_pow [| [| 1; 1 |]; [| 1; 0 |] |] n in
    result.(0).(1)

let () =
  for i = 0 to 10 do
    Printf.printf "%d " (fibonacci i)
  done;
  print_newline ()
