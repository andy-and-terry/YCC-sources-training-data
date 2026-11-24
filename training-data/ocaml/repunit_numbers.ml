(* Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1. *)
let () =
  let r = ref 0 in
  for _ = 1 to 8 do
    r := (!r * 10) + 1;
    Printf.printf "%d%s\n" !r (if !r mod 3 = 0 then "  (divisible by 3)" else "")
  done
