(* Reverse-and-add until a palindrome; count the steps. *)
let rev n =
  let s = string_of_int n in
  let len = String.length s in
  int_of_string (String.init len (fun i -> s.[len - 1 - i]))

let steps start =
  let rec go n count =
    if count > 0 && n = rev n then count
    else if count >= 50 then -1
    else go (n + rev n) (count + 1)
  in
  go start 0

let () =
  List.iter (fun n -> Printf.printf "%d " (steps n)) [ 56; 57; 59; 79; 89 ];
  print_newline ()
