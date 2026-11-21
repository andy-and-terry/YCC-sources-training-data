(* Count bouncy numbers (neither increasing nor decreasing digits) below 1000. *)
let is_bouncy n =
  let l = List.of_seq (String.to_seq (string_of_int n)) in
  let s = List.sort compare l in
  l <> s && l <> List.rev s

let () =
  let count = ref 0 in
  for n = 1 to 999 do
    if is_bouncy n then incr count
  done;
  Printf.printf "%d\n" !count
