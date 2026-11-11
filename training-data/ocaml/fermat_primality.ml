(* Fermat primality test; Carmichael number 561 fools it. *)
let rec powmod b e m =
  if e = 0 then 1 mod m
  else
    let half = powmod b (e / 2) m in
    let sq = half * half mod m in
    if e mod 2 = 0 then sq else sq * b mod m

let probably_prime n = n > 2 && powmod 2 (n - 1) n = 1

let () =
  List.iter (fun n -> Printf.printf "%d %b\n" n (probably_prime n)) [ 97; 91; 561 ]
