let lah n k =
  let c = ref 1 and f = ref 1 in
  for i = 0 to k - 2 do c := !c * (n - 1 - i) / (i + 1) done;
  for i = k + 1 to n do f := !f * i done;
  !c * !f

let () =
  for n = 1 to 5 do
    for k = 1 to n do Printf.printf "%d " (lah n k) done;
    print_newline ()
  done
