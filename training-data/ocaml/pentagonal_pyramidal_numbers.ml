(* n^2(n+1)/2 *)
let term n = ((n * n) * (n + 1)) / 2

let () =
  for n = 1 to 15 do
    Printf.printf "%2d -> %d\n" n (term n)
  done
