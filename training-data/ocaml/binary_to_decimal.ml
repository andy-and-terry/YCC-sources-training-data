let binary_to_decimal s = int_of_string ("0b" ^ s)

let () = print_int (binary_to_decimal "1011"); print_newline ()
