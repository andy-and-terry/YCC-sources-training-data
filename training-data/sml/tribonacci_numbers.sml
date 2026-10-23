(* Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3) *)
fun tribonacci count =
  let
    fun loop (0, _, _, _) = []
      | loop (n, a, b, c) = a :: loop (n - 1, b, c, a + b + c)
  in
    loop (count, 0, 0, 1)
  end

val _ = print ("Tribonacci: " ^ String.concatWith ", " (map Int.toString (tribonacci 15)) ^ "\n")
