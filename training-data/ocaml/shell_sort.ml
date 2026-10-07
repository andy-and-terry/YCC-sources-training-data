let shell_sort arr =
  let a = Array.copy arr in
  let n = Array.length a in
  let gap = ref (n / 2) in
  while !gap > 0 do
    for i = !gap to n - 1 do
      let temp = a.(i) in
      let j = ref i in
      while !j >= !gap && a.(!j - !gap) > temp do
        a.(!j) <- a.(!j - !gap);
        j := !j - !gap
      done;
      a.(!j) <- temp
    done;
    gap := !gap / 2
  done;
  a

let () =
  shell_sort [| 12; 34; 54; 2; 3 |]
  |> Array.to_list
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
