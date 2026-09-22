let sift_down arr n start =
  let rec loop i =
    let largest = ref i in
    let l = (2 * i) + 1 and r = (2 * i) + 2 in
    if l < n && arr.(l) > arr.(!largest) then largest := l;
    if r < n && arr.(r) > arr.(!largest) then largest := r;
    if !largest <> i then begin
      let tmp = arr.(i) in
      arr.(i) <- arr.(!largest);
      arr.(!largest) <- tmp;
      loop !largest
    end
  in
  loop start

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
  done

let () =
  let arr = [| 5; 2; 8; 1; 9; 3; 7 |] in
  heap_sort arr;
  Array.iter (fun x -> Printf.printf "%d " x) arr;
  print_newline ()
