let two_sum nums target =
  let seen = Hashtbl.create 16 in
  let rec go i = function
    | [] -> None
    | n :: rest ->
        let complement = target - n in
        if Hashtbl.mem seen complement then Some (Hashtbl.find seen complement, i)
        else (
          Hashtbl.add seen n i;
          go (i + 1) rest)
  in
  go 0 nums

let () =
  match two_sum [ 2; 7; 11; 15 ] 9 with
  | Some (i, j) -> Printf.printf "%d %d\n" i j
  | None -> print_endline "none"
