(* Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2) *)
fun jac n =
  let fun go (0, a, _) = a
        | go (k, a, b) = go (k - 1, b, b + 2 * a)
  in go (n, 0, 1) end;

val terms = List.tabulate (15, jac);
val _ = print (String.concatWith " " (map Int.toString terms) ^ "\n");
