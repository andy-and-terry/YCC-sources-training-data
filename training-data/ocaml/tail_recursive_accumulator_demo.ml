let rec sum_naive = function [] -> 0 | x :: xs -> x + sum_naive xs

let sum_tail lst =
  let rec go acc = function [] -> acc | x :: xs -> go (acc + x) xs in
  go 0 lst

let () =
  let big = List.init 1_000_000 (fun i -> i) in
  Printf.printf "tail: %d\n" (sum_tail big);
  Printf.printf "small naive: %d\n" (sum_naive [ 1; 2; 3 ])
