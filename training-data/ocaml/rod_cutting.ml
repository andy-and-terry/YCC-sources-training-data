(* Bottom-up rod cutting: dp.(n) holds the best revenue for a rod of
   length n, built from the best revenue of every shorter piece plus one
   more cut of length i. *)
let max_revenue prices rod_length =
  let dp = Array.make (rod_length + 1) 0 in
  for n = 1 to rod_length do
    let best = ref 0 in
    for i = 1 to n do
      if i <= Array.length prices then
        let candidate = prices.(i - 1) + dp.(n - i) in
        if candidate > !best then best := candidate
    done;
    dp.(n) <- !best
  done;
  dp.(rod_length)

let () =
  let prices = [| 1; 5; 8; 9; 10; 17; 17; 20 |] in
  Printf.printf "%d\n" (max_revenue prices 8);
  Printf.printf "%d\n" (max_revenue prices 4)
