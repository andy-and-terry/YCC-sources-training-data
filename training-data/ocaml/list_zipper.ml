(* A zipper turns a list into a cursor that can move left and right in
   constant time, keeping the elements already passed over reversed in
   `left` so that stepping back is just a cons/decons away. *)
type 'a zipper = { left : 'a list; focus : 'a; right : 'a list }

let of_list = function
  | [] -> invalid_arg "of_list: empty list"
  | x :: rest -> { left = []; focus = x; right = rest }

let move_right z =
  match z.right with
  | [] -> None
  | x :: rest -> Some { left = z.focus :: z.left; focus = x; right = rest }

let move_left z =
  match z.left with
  | [] -> None
  | x :: rest -> Some { left = rest; focus = x; right = z.focus :: z.right }

let to_list z = List.rev z.left @ (z.focus :: z.right)

let () =
  let z = of_list [ 1; 2; 3; 4; 5 ] in
  match Option.bind (move_right z) move_right with
  | Some z2 ->
      Printf.printf "focus: %d\n" z2.focus;
      to_list z2 |> List.map string_of_int |> String.concat " " |> print_endline
  | None -> ()
