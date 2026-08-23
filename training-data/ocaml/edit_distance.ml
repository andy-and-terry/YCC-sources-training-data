let edit_distance a b =
  let m = String.length a in
  let n = String.length b in
  let table = Array.make_matrix (m + 1) (n + 1) 0 in
  for i = 0 to m do table.(i).(0) <- i done;
  for j = 0 to n do table.(0).(j) <- j done;
  for i = 1 to m do
    for j = 1 to n do
      let cost = if a.[i - 1] = b.[j - 1] then 0 else 1 in
      table.(i).(j) <- min (min (table.(i - 1).(j) + 1) (table.(i).(j - 1) + 1)) (table.(i - 1).(j - 1) + cost)
    done
  done;
  table.(m).(n)

let () = print_int (edit_distance "kitten" "sitting"); print_newline ()
