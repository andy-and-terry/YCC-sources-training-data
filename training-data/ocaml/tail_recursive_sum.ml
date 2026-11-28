let sum xs =
  let rec go acc = function [] -> acc | x :: t -> go (acc + x) t in
  go 0 xs

let () = Printf.printf "%d\n" (sum (List.init 100000 Fun.id))
