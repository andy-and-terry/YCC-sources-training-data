let rec is_even n = if n = 0 then true else is_odd (n - 1)
and is_odd n = if n = 0 then false else is_even (n - 1)

let () =
  List.iter
    (fun n -> Printf.printf "%d even=%b odd=%b\n" n (is_even n) (is_odd n))
    [ 0; 1; 4; 7 ]
