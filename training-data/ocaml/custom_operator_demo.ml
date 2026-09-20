(* Custom operators in OCaml are ordinary functions whose names are built
   from symbolic characters; the leading character(s) determine fixity
   and precedence, the same way built-in operators are classified. *)
let ( +% ) a b = (a + b) mod 100

let ( |>? ) opt f = match opt with Some x -> f x | None -> None

let () =
  Printf.printf "%d\n" (95 +% 10);
  let result = Some 4 |>? (fun x -> if x > 0 then Some (x * x) else None) in
  match result with Some v -> Printf.printf "%d\n" v | None -> print_endline "none"
