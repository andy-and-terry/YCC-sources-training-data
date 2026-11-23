(* n(n+1)(n+2)/6 *)
let term n = ((n * (n + 1)) * (n + 2)) / 6

let () =
  for n = 1 to 15 do
    Printf.printf "%2d -> %d\n" n (term n)
  done
