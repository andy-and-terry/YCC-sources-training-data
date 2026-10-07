let sift_down arr n i =
  let rec go i =
    let largest = ref i in
    let left = (2 * i) + 1 in
    let right = (2 * i) + 2 in
    if left < n && arr.(left) > arr.(!largest) then largest := left;
    if right < n && arr.(right) > arr.(!largest) then largest := right;
    if !largest <> i then (
      let tmp = arr.(i) in
      arr.(i) <- arr.(!largest);
      arr.(!largest) <- tmp;
      go !largest)
  in
  go i

let heap_sort arr =
  let n = Array.length arr in
  for i = (n / 2) - 1 downto 0 do
    sift_down arr n i
  done;
  for i = n - 1 downto 1 do
    let tmp = arr.(0) in
    arr.(0) <- arr.(i);
    arr.(i) <- tmp;
    sift_down arr i 0
  done;
  arr

let () =
  let arr = [| 5; 3; 8; 1; 9; 2; 7 |] in
  let sorted = heap_sort arr in
  Array.iter (fun n -> Printf.printf "%d " n) sorted;
  print_newline ()
