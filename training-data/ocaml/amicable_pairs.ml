(* Amicable pairs: d(a) = b and d(b) = a with a <> b. *)
let d n =
  let s = ref 0 in
  for i = 1 to n - 1 do
    if n mod i = 0 then s := !s + i
  done;
  !s

let () =
  for a = 2 to 1499 do
    let b = d a in
    if b > a && d b = a then Printf.printf "%d %d\n" a b
  done
