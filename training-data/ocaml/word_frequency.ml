let word_frequency text =
  let words = String.split_on_char ' ' (String.lowercase_ascii text) in
  let freq = Hashtbl.create 16 in
  List.iter
    (fun w ->
      let count = try Hashtbl.find freq w with Not_found -> 0 in
      Hashtbl.replace freq w (count + 1))
    words;
  freq

let () =
  let freq = word_frequency "the quick brown fox the lazy fox" in
  Hashtbl.iter (fun k v -> Printf.printf "%s: %d\n" k v) freq
