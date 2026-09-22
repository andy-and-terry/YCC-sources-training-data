let has_subset_sum nums target =
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
  Printf.printf "%b\n" (has_subset_sum [ 3; 34; 4; 12; 5; 2 ] 9);
  Printf.printf "%b\n" (has_subset_sum [ 3; 34; 4; 12; 5; 2 ] 10);
  Printf.printf "%b\n" (has_subset_sum [ 1; 2; 5 ] 4)
