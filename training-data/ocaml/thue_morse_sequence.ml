(* Thue-Morse: t(n) is the parity of the number of 1 bits in n *)
let rec parity n = if n = 0 then 0 else (n land 1) lxor parity (n lsr 1)

let () =
  for n = 0 to 31 do
    print_int (parity n)
  done;
  print_newline ()
