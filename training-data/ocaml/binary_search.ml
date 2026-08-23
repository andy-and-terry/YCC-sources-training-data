let rec binary_search arr low high target =
  if low > high then -1
  else
    let mid = (low + high) / 2 in
    if arr.(mid) = target then mid
    else if arr.(mid) < target then binary_search arr (mid + 1) high target
    else binary_search arr low (mid - 1) target

let () =
  let data = [| 1; 3; 5; 7; 9; 11 |] in
  print_int (binary_search data 0 (Array.length data - 1) 7); print_newline ()
