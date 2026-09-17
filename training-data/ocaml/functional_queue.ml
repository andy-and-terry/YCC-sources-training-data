(* A purely functional FIFO queue built from two lists: pushing is O(1)
   onto the back list, and popping is amortized O(1), reversing the
   back list into front only when front runs empty. *)
type 'a queue = { front : 'a list; back : 'a list }

let empty = { front = []; back = [] }

let push q x = { q with back = x :: q.back }

let pop q =
  match q.front with
  | x :: rest -> Some (x, { front = rest; back = q.back })
  | [] -> (
      match List.rev q.back with
      | x :: rest -> Some (x, { front = rest; back = [] })
      | [] -> None)

let () =
  let q = List.fold_left push empty [ 1; 2; 3 ] in
  match pop q with
  | Some (x, q') -> (
      Printf.printf "%d\n" x;
      match pop q' with
      | Some (y, _) -> Printf.printf "%d\n" y
      | None -> print_endline "empty")
  | None -> print_endline "empty"
