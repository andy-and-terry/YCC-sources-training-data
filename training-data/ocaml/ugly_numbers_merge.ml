let ugly n =
  let seq = Array.make n 1 in
  let i2 = ref 0 and i3 = ref 0 and i5 = ref 0 in
  for k = 1 to n - 1 do
    let c2 = seq.(!i2) * 2 and c3 = seq.(!i3) * 3 and c5 = seq.(!i5) * 5 in
    let next = min c2 (min c3 c5) in
    seq.(k) <- next;
    if next = c2 then incr i2;
    if next = c3 then incr i3;
    if next = c5 then incr i5
  done;
  seq.(n - 1)

let () =
  List.init 12 (fun i -> string_of_int (ugly (i + 1))) |> String.concat " " |> print_endline
