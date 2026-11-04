type 'a min_stack = ('a * 'a) list

let push x = function
  | [] -> [ (x, x) ]
  | (_, m) :: _ as s -> (x, min x m) :: s

let pop = function [] -> [] | _ :: rest -> rest
let current_min = function (_, m) :: _ -> m | [] -> failwith "empty"

let () =
  let s = List.fold_left (fun acc x -> push x acc) [] [ 5; 3; 7; 2 ] in
  Printf.printf "%d\n%d\n" (current_min s) (current_min (pop s))
