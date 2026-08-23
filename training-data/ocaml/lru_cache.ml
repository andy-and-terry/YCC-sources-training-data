type lru_cache = { capacity : int; map : (int, int) Hashtbl.t; mutable order : int list }

let create capacity = { capacity; map = Hashtbl.create 16; order = [] }

let get cache key =
  if Hashtbl.mem cache.map key then (
    cache.order <- key :: List.filter (( <> ) key) cache.order;
    Some (Hashtbl.find cache.map key))
  else None

let put cache key value =
  if Hashtbl.mem cache.map key then cache.order <- List.filter (( <> ) key) cache.order;
  Hashtbl.replace cache.map key value;
  cache.order <- key :: cache.order;
  if List.length cache.order > cache.capacity then (
    let evict = List.nth cache.order (List.length cache.order - 1) in
    cache.order <- List.filter (( <> ) evict) cache.order;
    Hashtbl.remove cache.map evict)

let () =
  let cache = create 2 in
  put cache 1 1;
  put cache 2 2;
  (match get cache 1 with Some v -> print_int v | None -> ());
  print_newline ();
  put cache 3 3;
  match get cache 2 with Some v -> print_int v | None -> print_string "none"
