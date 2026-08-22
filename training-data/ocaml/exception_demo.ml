exception Division_by_zero

let safe_divide a b =
  if b = 0 then raise Division_by_zero
  else a / b

let () =
  Printf.printf "%d\n" (safe_divide 10 2);
  try
    Printf.printf "%d\n" (safe_divide 5 0)
  with Division_by_zero -> print_endline "error: division by zero"
