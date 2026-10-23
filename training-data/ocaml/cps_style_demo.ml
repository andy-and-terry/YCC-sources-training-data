(* Continuation-passing style: instead of returning, functions call
   a continuation [k] with their result. *)

let rec fact_cps n k =
  if n <= 1 then k 1
  else fact_cps (n - 1) (fun r -> k (n * r))

let rec sum_cps lst k =
  match lst with
  | [] -> k 0
  | x :: rest -> sum_cps rest (fun s -> k (x + s))

(* Early exit: call the failure continuation instead of raising. *)
let rec find_cps p lst ~found ~missing =
  match lst with
  | [] -> missing ()
  | x :: _ when p x -> found x
  | _ :: rest -> find_cps p rest ~found ~missing

let () =
  Printf.printf "5! = %d\n" (fact_cps 5 (fun x -> x));
  Printf.printf "sum = %d\n" (sum_cps [ 1; 2; 3; 4 ] (fun x -> x));
  find_cps (fun x -> x > 10) [ 3; 8; 12; 20 ]
    ~found:(Printf.printf "found %d\n")
    ~missing:(fun () -> print_endline "none");
  find_cps (fun x -> x > 100) [ 3; 8 ]
    ~found:(Printf.printf "found %d\n")
    ~missing:(fun () -> print_endline "none")
