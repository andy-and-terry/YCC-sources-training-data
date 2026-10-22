(* Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
   OCaml ints are 63-bit, so s(0)..s(6) fit; s(7) would wrap. *)
let () =
  let s = ref 2 in
  for i = 0 to 6 do
    Printf.printf "s(%d) = %d\n" i !s;
    s := (!s * !s) - !s + 1
  done
