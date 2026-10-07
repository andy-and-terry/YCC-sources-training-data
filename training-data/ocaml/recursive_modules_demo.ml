(* `module rec` lets two modules refer to each other's types, mirroring
   `let rec ... and ...` for functions but at the module level. Each
   recursive module needs an explicit signature so the compiler can
   check the mutual references without first compiling either module. *)
module rec Even : sig
  val is_even : int -> bool
end = struct
  let is_even n = n = 0 || Odd.is_odd (n - 1)
end

and Odd : sig
  val is_odd : int -> bool
end = struct
  let is_odd n = n <> 0 && Even.is_even (n - 1)
end

let () =
  List.iter
    (fun n -> Printf.printf "%d even=%b odd=%b\n" n (Even.is_even n) (Odd.is_odd n))
    [ 0; 1; 4; 7 ]
