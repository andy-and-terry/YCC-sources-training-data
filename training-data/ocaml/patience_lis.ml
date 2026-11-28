let lis_length a =
  let rec insert x = function
    | [] -> [ x ]
    | t :: rest when t >= x -> x :: rest
    | t :: rest -> t :: insert x rest
  in
  List.length (List.fold_left (fun tails x -> insert x tails) [] a)

let () = Printf.printf "%d\n" (lis_length [ 10; 9; 2; 5; 3; 7; 101; 18 ])
