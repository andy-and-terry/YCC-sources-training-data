let factorize n =
  let rec go n p acc =
    if n = 1 then List.rev acc
    else if p * p > n then List.rev (n :: acc)
    else if n mod p = 0 then go (n / p) p (p :: acc)
    else go n (p + 1) acc
  in
  go n 2 []

let () =
  List.iter
    (fun n ->
      Printf.printf "%d = %s\n" n
        (String.concat " * " (List.map string_of_int (factorize n))))
    [ 360; 97; 1001 ]
