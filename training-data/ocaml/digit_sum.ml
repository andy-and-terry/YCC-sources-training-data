let rec digit_sum n = if n < 10 then n else (n mod 10) + digit_sum (n / 10)

let () = print_int (digit_sum 12345); print_newline ()
