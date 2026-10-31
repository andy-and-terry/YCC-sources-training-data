let rec digit_product n = if n = 0 then 1 else (n mod 10) * digit_product (n / 10)

let rec persistence n = if n < 10 then 0 else 1 + persistence (digit_product n)

let () =
  List.iter (fun n -> Printf.printf "%d %d\n" n (persistence n)) [ 39; 77; 999; 10 ]
