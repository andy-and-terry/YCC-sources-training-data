let rec popcount n = if n = 0 then 0 else (n land 1) + popcount (n lsr 1)
let gould n = 1 lsl popcount n

let () =
  List.init 16 gould |> List.iter (Printf.printf "%d ");
  print_newline ()
