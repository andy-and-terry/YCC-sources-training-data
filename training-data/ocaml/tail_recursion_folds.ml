let rec sum_to n acc = if n = 0 then acc else sum_to (n - 1) (acc + n)

let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let fib n =
  let rec go a b i = if i = 0 then a else go b (a + b) (i - 1) in
  go 0 1 n

let rev l =
  let rec go acc = function [] -> acc | x :: r -> go (x :: acc) r in
  go [] l

let () =
  Printf.printf "%d %d %d\n" (sum_to 1_000_000 0) (gcd 84 36) (fib 50);
  print_endline (String.concat "," (List.map string_of_int (rev [ 1; 2; 3 ])));
  let rec hanoi n = if n = 0 then 0 else (2 * hanoi (n - 1)) + 1 in
  Printf.printf "%d\n" (hanoi 10)
