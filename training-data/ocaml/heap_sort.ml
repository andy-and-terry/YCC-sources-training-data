let rec heapify arr n i =
  let largest = ref i in
  let left = 2 * i + 1 in
  let right = 2 * i + 2 in
  if left < n && arr.(left) > arr.(!largest) then largest := left;
  if right < n && arr.(right) > arr.(!largest) then largest := right;
  if !largest <> i then begin
    let temp = arr.(i) in
    arr.(i) <- arr.(!largest);
    arr.(!largest) <- temp;
    heapify arr n !largest
  end

let heap_sort arr =
  let a = Array.copy arr in
  let n = Array.length a in
  for i = n / 2 - 1 downto 0 do
    heapify a n i
  done;
  for i = n - 1 downto 1 do
    let temp = a.(0) in
    a.(0) <- a.(i);
    a.(i) <- temp;
    heapify a i 0
  done;
  a

let () =
  heap_sort [| 5; 3; 8; 1; 9; 2 |]
  |> Array.to_list
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
