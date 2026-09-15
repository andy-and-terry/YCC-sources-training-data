let partition arr low high =
  let pivot = arr.(high) in
  let i = ref (low - 1) in
  for j = low to high - 1 do
    if arr.(j) <= pivot then begin
      incr i;
      let tmp = arr.(!i) in
      arr.(!i) <- arr.(j);
      arr.(j) <- tmp
    end
  done;
  let tmp = arr.(!i + 1) in
  arr.(!i + 1) <- arr.(high);
  arr.(high) <- tmp;
  !i + 1

let rec quickselect arr low high k =
  if low = high then arr.(low)
  else
    let pivot_index = partition arr low high in
    if k = pivot_index then arr.(k)
    else if k < pivot_index then quickselect arr low (pivot_index - 1) k
    else quickselect arr (pivot_index + 1) high k

let kth_smallest arr k =
  let copy = Array.copy arr in
  quickselect copy 0 (Array.length copy - 1) (k - 1)

let () =
  let data = [| 7; 2; 9; 4; 1; 8; 3; 6 |] in
  Printf.printf "%d\n" (kth_smallest data 3);
  Printf.printf "%d\n" (kth_smallest data 1);
  Printf.printf "%d\n" (kth_smallest data (Array.length data))
