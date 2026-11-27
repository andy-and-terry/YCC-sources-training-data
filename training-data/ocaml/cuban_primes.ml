let is_prime n =
  let rec go i = i * i > n || (n mod i <> 0 && go (i + 1)) in
  n >= 2 && go 2

let () =
  let rec loop y found =
    if found < 8 then begin
      let p = (3 * y * y) + (3 * y) + 1 in
      if is_prime p then (Printf.printf "%d " p; loop (y + 1) (found + 1))
      else loop (y + 1) found
    end
  in
  loop 1 0;
  print_newline ()
