let rec catalan n =
  if n <= 1 then 1
  else
    let total = ref 0 in
    for i = 0 to n - 1 do
      total := !total + (catalan i * catalan (n - 1 - i))
    done;
    !total

let () =
  for i = 0 to 7 do
    Printf.printf "%d " (catalan i)
  done;
  print_newline ()
