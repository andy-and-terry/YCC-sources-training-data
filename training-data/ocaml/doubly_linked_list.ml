type 'a node = { value : 'a; mutable prev : 'a node option; mutable next : 'a node option }
type 'a dlist = { mutable head : 'a node option; mutable tail : 'a node option }

let create () = { head = None; tail = None }

let push_back dl value =
  let node = { value; prev = dl.tail; next = None } in
  (match dl.tail with
  | Some t -> t.next <- Some node
  | None -> dl.head <- Some node);
  dl.tail <- Some node

let to_list_forward dl =
  let rec go node acc =
    match node with
    | None -> List.rev acc
    | Some n -> go n.next (n.value :: acc)
  in
  go dl.head []

let to_list_backward dl =
  let rec go node acc =
    match node with
    | None -> List.rev acc
    | Some n -> go n.prev (n.value :: acc)
  in
  go dl.tail []

let () =
  let dl = create () in
  List.iter (push_back dl) [ 1; 2; 3; 4 ];
  List.iter (Printf.printf "%d ") (to_list_forward dl);
  print_newline ();
  List.iter (Printf.printf "%d ") (to_list_backward dl);
  print_newline ()
