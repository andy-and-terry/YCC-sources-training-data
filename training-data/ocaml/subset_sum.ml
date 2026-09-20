let subset_sum nums target =
  let dp = Array.make (target + 1) false in
  dp.(0) <- true;
  List.iter
    (fun n ->
      for sum = target downto n do
        if dp.(sum - n) then dp.(sum) <- true
      done)
    nums;
  dp.(target)

let () =
  let nums = [ 3; 34; 4; 12; 5; 2 ] in
  Printf.printf "%b\n" (subset_sum nums 9);
  Printf.printf "%b\n" (subset_sum nums 10);
  Printf.printf "%b\n" (subset_sum nums 100)
