let sum_naive l =
  let rec go = function [] -> 0 | x :: r -> x + go r in
  go l

let sum_tail l =
  let rec go acc = function [] -> acc | x :: r -> go (acc + x) r in
  go 0 l

let () =
  let big = List.init 1_000_000 (fun i -> i) in
  Printf.printf "tail-recursive sum: %d\n" (sum_tail big);
  let small = List.init 1000 Fun.id in
  Printf.printf "naive sum (small): %d\n" (sum_naive small);
  let rec count_down n acc = if n = 0 then acc else count_down (n - 1) (acc + 1) in
  Printf.printf "loop of 10 million: %d\n" (count_down 10_000_000 0)
