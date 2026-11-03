let rec digit_square_sum n =
  let n = abs n in
  if n = 0 then 0 else ((n mod 10) * (n mod 10)) + digit_square_sum (n / 10)

let () =
  Printf.printf "%d\n%d\n" (digit_square_sum 123) (digit_square_sum (-99))
