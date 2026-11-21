(* Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0). *)
let rec pow b e = if e = 0 then 1 else b * pow b (e - 1)

let is_munchausen n =
  let rec go m acc =
    if m = 0 then acc
    else
      let d = m mod 10 in
      go (m / 10) (acc + if d = 0 then 0 else pow d d)
  in
  go n 0 = n

let () =
  for n = 1 to 4999 do
    if is_munchausen n then Printf.printf "%d " n
  done;
  print_newline ()
