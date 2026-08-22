type 'a stack = { mutable items : 'a list }

let create () = { items = [] }

let push s item = s.items <- item :: s.items

let pop s =
  match s.items with
  | [] -> None
  | head :: tail ->
      s.items <- tail;
      Some head

let peek s = match s.items with [] -> None | head :: _ -> Some head

let is_empty s = s.items = []

let () =
  let s = create () in
  push s 1;
  push s 2;
  push s 3;
  Printf.printf "%d %b\n" (Option.get (pop s)) (is_empty s)
