let rec heapify arr n i =
  let largest = ref i in
  let left = (2 * i) + 1 in
  let right = (2 * i) + 2 in
  if left < n && arr.(left) > arr.(!largest) then largest := left;
  if right < n && arr.(right) > arr.(!largest) then largest := right;
  if !largest <> i then (
    let tmp = arr.(i) in
    arr.(i) <- arr.(!largest);
    arr.(!largest) <- tmp;
    heapify arr n !largest)

let heap_sort arr =
  let n = Array.length arr in
  for i = (n / 2) - 1 downto 0 do
    heapify arr n i
  done;
  for i = n - 1 downto 1 do
    let tmp = arr.(0) in
    arr.(0) <- arr.(i);
    arr.(i) <- tmp;
    heapify arr i 0
  done

let () =
  let arr = [| 5; 2; 9; 1; 5; 6; 3 |] in
  heap_sort arr;
  arr |> Array.to_list |> List.map string_of_int |> String.concat " " |> print_endline
