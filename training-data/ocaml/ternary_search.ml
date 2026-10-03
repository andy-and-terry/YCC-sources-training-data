let ternary_search arr target =
  let rec go lo hi =
    if lo > hi then -1
    else
      let third = (hi - lo) / 3 in
      let m1 = lo + third and m2 = hi - third in
      if arr.(m1) = target then m1
      else if arr.(m2) = target then m2
      else if target < arr.(m1) then go lo (m1 - 1)
      else if target > arr.(m2) then go (m2 + 1) hi
      else go (m1 + 1) (m2 - 1)
  in
  go 0 (Array.length arr - 1)

let () =
  let arr = [| 1; 3; 5; 7; 9; 11; 13; 15 |] in
  Printf.printf "%d\n" (ternary_search arr 9);
  Printf.printf "%d\n" (ternary_search arr 4)
