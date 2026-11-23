(* n(2n^2+1)/3 *)
let term n = (n * (((2 * n) * n) + 1)) / 3

let () =
  for n = 1 to 15 do
    Printf.printf "%2d -> %d\n" n (term n)
  done
