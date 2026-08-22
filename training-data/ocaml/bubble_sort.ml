let bubble_sort arr =
  let a = Array.copy arr in
  let n = Array.length a in
  for i = 0 to n - 1 do
    for j = 0 to n - i - 2 do
      if a.(j) > a.(j + 1) then begin
        let temp = a.(j) in
        a.(j) <- a.(j + 1);
        a.(j + 1) <- temp
      end
    done
  done;
  a

let () =
  bubble_sort [| 5; 2; 9; 1; 5; 6 |]
  |> Array.to_list
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
