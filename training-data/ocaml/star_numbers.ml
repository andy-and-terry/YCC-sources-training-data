(* 6n(n-1)+1 *)
let term n = ((6 * n) * (n - 1)) + 1

let () =
  for n = 1 to 15 do
    Printf.printf "%2d -> %d\n" n (term n)
  done
