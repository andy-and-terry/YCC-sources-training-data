let rec rev_append l acc = match l with [] -> acc | h :: t -> rev_append t (h :: acc)
let rev l = rev_append l []
let () = List.iter (Printf.printf "%d ") (rev [1; 2; 3; 4]); print_newline ()
