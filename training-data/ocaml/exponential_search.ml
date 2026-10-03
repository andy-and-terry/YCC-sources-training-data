let binary_search arr target lo hi =
  let rec go lo hi =
    if lo > hi then -1
    else
      let mid = lo + ((hi - lo) / 2) in
      if arr.(mid) = target then mid
      else if arr.(mid) < target then go (mid + 1) hi
      else go lo (mid - 1)
  in
  go lo hi

let exponential_search arr target =
  let n = Array.length arr in
  if n = 0 then -1
  else if arr.(0) = target then 0
  else begin
    let bound = ref 1 in
    while !bound < n && arr.(!bound) <= target do
      bound := !bound * 2
    done;
    binary_search arr target (!bound / 2) (min !bound (n - 1))
  end

let () =
  let arr = [| 1; 3; 5; 7; 9; 11; 13; 15; 17; 19 |] in
  Printf.printf "%d\n" (exponential_search arr 13);
  Printf.printf "%d\n" (exponential_search arr 4)
