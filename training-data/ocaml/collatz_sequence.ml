let step n = if n mod 2 = 0 then n / 2 else (3 * n) + 1

let collatz_length n =
  let rec go n acc = if n = 1 then acc else go (step n) (acc + 1) in
  go n 0

let () =
  Printf.printf "27 takes %d steps\n" (collatz_length 27);
  let best = ref 1 in
  for i = 2 to 1000 do
    if collatz_length i > collatz_length !best then best := i
  done;
  Printf.printf "longest under 1000: %d (%d steps)\n" !best (collatz_length !best)
