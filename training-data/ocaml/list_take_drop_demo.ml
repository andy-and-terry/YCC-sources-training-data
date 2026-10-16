let rec take n = function
  | x :: rest when n > 0 -> x :: take (n - 1) rest
  | _ -> []

let rec drop n = function
  | _ :: rest when n > 0 -> drop (n - 1) rest
  | l -> l

let rec take_while p = function
  | x :: rest when p x -> x :: take_while p rest
  | _ -> []

let show l = print_endline (String.concat " " (List.map string_of_int l))

let () =
  let xs = [ 1; 2; 3; 4; 5; 6; 7 ] in
  show (take 3 xs);
  show (drop 3 xs);
  show (take 10 xs);
  show (take_while (fun x -> x < 4) xs);
  show (drop 10 xs)
