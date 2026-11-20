(* Lattice paths using the recurrence f(r,c) = f(r-1,c) + f(r,c-1). *)
fun lattice (0, _) = 1
  | lattice (_, 0) = 1
  | lattice (r, c) = lattice (r - 1, c) + lattice (r, c - 1)
val _ = print (Int.toString (lattice (3, 3)) ^ "\n")
