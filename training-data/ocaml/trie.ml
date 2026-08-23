module CharMap = Map.Make (Char)

type trie = { children : trie CharMap.t; is_end : bool }

let empty_trie = { children = CharMap.empty; is_end = false }

let rec insert trie word =
  match word with
  | "" -> { trie with is_end = true }
  | _ ->
      let c = word.[0] in
      let rest = String.sub word 1 (String.length word - 1) in
      let child = try CharMap.find c trie.children with Not_found -> empty_trie in
      { trie with children = CharMap.add c (insert child rest) trie.children }

let rec contains trie word =
  match word with
  | "" -> trie.is_end
  | _ -> (
      let c = word.[0] in
      let rest = String.sub word 1 (String.length word - 1) in
      match CharMap.find_opt c trie.children with
      | Some child -> contains child rest
      | None -> false)

let () =
  let trie = insert (insert empty_trie "cat") "car" in
  print_endline (string_of_bool (contains trie "cat"));
  print_endline (string_of_bool (contains trie "ca"))
