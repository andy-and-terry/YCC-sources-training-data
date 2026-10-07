(* Catalan numbers via the DP recurrence
   C(0) = 1, C(n) = sum_{i=0}^{n-1} C(i) * C(n-1-i). *)
fun catalan n =
  let
    val dp = Array.array (n + 1, 0)
    val () = Array.update (dp, 0, 1)
    val () =
      List.app
        (fn k =>
          let
            val total = ref 0
            val () =
              List.app
                (fn i => total := !total + Array.sub (dp, i) * Array.sub (dp, k - 1 - i))
                (List.tabulate (k, fn i => i))
          in
            Array.update (dp, k, !total)
          end)
        (List.tabulate (n, fn x => x + 1))
  in
    Array.sub (dp, n)
  end

val () =
  app
    (fn n => print (Int.toString n ^ " -> " ^ Int.toString (catalan n) ^ "\n"))
    [0, 1, 2, 3, 4, 5, 10]
