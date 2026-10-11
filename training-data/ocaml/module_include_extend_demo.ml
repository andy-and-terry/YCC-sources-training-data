module ListExt = struct
  include List

  let sum l = fold_left ( + ) 0 l
  let rec last = function [] -> None | [ x ] -> Some x | _ :: t -> last t
end

let () =
  let xs = [ 4; 8; 15; 16; 23; 42 ] in
  Printf.printf "length via include: %d\n" (ListExt.length xs);
  Printf.printf "sum: %d\n" (ListExt.sum xs);
  match ListExt.last xs with
  | Some x -> Printf.printf "last: %d\n" x
  | None -> print_endline "empty"
