type 'a node = { value : 'a; mutable prev : 'a node option; mutable next : 'a node option }
type 'a dlist = { mutable head : 'a node option; mutable tail : 'a node option }

let create () = { head = None; tail = None }

let push_back list value =
  let node = { value; prev = list.tail; next = None } in
  (match list.tail with Some t -> t.next <- Some node | None -> list.head <- Some node);
  list.tail <- Some node

let push_front list value =
  let node = { value; prev = None; next = list.head } in
  (match list.head with Some h -> h.prev <- Some node | None -> list.tail <- Some node);
  list.head <- Some node

let to_list list =
  let rec go acc = function
    | None -> List.rev acc
    | Some n -> go (n.value :: acc) n.next
  in
  go [] list.head

let () =
  let list = create () in
  push_back list 2;
  push_back list 3;
  push_front list 1;
  push_back list 4;
  to_list list |> List.map string_of_int |> String.concat " " |> print_endline
