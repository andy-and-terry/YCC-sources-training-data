(* Amicable pairs below 1500 via sums of proper divisors. *)
let s n =
  let t = ref 0 in
  for d = 1 to n - 1 do
    if n mod d = 0 then t := !t + d
  done;
  !t

let () =
  for a = 2 to 1499 do
    let b = s a in
    if b > a && s b = a then Printf.printf "%d %d\n" a b
  done
