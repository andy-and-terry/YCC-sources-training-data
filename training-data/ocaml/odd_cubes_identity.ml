let cube_from_odds n =
  let start = (n * n) - n + 1 in
  let rec go i acc = if i = n then acc else go (i + 1) (acc + start + (2 * i)) in
  go 0 0

let () =
  for n = 1 to 5 do
    Printf.printf "%d %d %b\n" n (cube_from_odds n) (cube_from_odds n = n * n * n)
  done
