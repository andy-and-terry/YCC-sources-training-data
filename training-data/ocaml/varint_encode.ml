let rec varint n =
  if n < 128 then [ n ] else ((n land 127) lor 128) :: varint (n lsr 7)

let () = List.iter (Printf.printf "%02x ") (varint 300); print_newline ()
