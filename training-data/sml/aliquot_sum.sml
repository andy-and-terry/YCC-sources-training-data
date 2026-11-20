(* Aliquot sum classification. *)
fun aliquot n =
  let fun go d s = if d >= n then s else go (d + 1) (if n mod d = 0 then s + d else s) in go 1 0 end
fun kind n a = case Int.compare (a, n) of EQUAL => "perfect" | GREATER => "abundant" | LESS => "deficient"
val _ = List.app (fn n => let val a = aliquot n in
  print (Int.toString n ^ " " ^ Int.toString a ^ " " ^ kind n a ^ "\n") end) [6, 12, 15, 28]
