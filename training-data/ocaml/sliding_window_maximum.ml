let max_sliding_window nums k =
  let n = Array.length nums in
  let deque = Array.make n 0 in
  let front = ref 0 and back = ref 0 in
  let result = ref [] in
  for i = 0 to n - 1 do
    while !front < !back && deque.(!back - 1) < 0 do
      ignore deque
    done;
    if !front < !back && deque.(!front) <= i - k then incr front;
    while !front < !back && nums.(deque.(!back - 1)) <= nums.(i) do
      decr back
    done;
    deque.(!back) <- i;
    incr back;
    if i >= k - 1 then result := nums.(deque.(!front)) :: !result
  done;
  List.rev !result

let () =
  let nums = [| 1; 3; -1; -3; 5; 3; 6; 7 |] in
  max_sliding_window nums 3 |> List.map string_of_int |> String.concat " " |> print_endline
