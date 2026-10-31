let alternating_digit_sum n =
  let rec go n sign acc =
    if n = 0 then acc else go (n / 10) (-sign) (acc + (sign * (n mod 10)))
  in
  go n 1 0

let () =
  List.iter (fun n -> Printf.printf "%d %d\n" n (alternating_digit_sum n)) [ 1234; 99999; 1000 ]
