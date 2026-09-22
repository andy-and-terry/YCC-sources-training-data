let subset_sum arr target =
  let n = Array.length arr in
  let dp = Array.make_matrix (n + 1) (target + 1) false in
  for i = 0 to n do
    dp.(i).(0) <- true
  done;
  for i = 1 to n do
    for s = 1 to target do
      dp.(i).(s) <- dp.(i - 1).(s) || (s >= arr.(i - 1) && dp.(i - 1).(s - arr.(i - 1)))
    done
  done;
  dp.(n).(target)

let () =
  let arr = [| 3; 34; 4; 12; 5; 2 |] in
  Printf.printf "%b\n" (subset_sum arr 9);
  (* 4 + 5 = 9 *)
  Printf.printf "%b\n" (subset_sum arr 15);
  (* 3 + 12 = 15 *)
  Printf.printf "%b\n" (subset_sum arr 30)
(* no subset sums to exactly 30 *)
