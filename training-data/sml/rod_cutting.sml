(* Unbounded rod-cutting: maximize revenue cutting a rod of length n
   given price[i] = revenue for a piece of length i+1. *)
fun rod_cutting (prices, n) =
  let
    val dp = Array.array (n + 1, 0)
    val () =
      List.app
        (fn len =>
          let
            val best = ref 0
            val () =
              List.app
                (fn cut =>
                  let
                    val revenue = Array.sub (prices, cut - 1) + Array.sub (dp, len - cut)
                  in
                    if revenue > !best then best := revenue else ()
                  end)
                (List.tabulate (len, fn x => x + 1))
          in
            Array.update (dp, len, !best)
          end)
        (List.tabulate (n, fn x => x + 1))
  in
    Array.sub (dp, n)
  end

val prices = Array.fromList [1, 5, 8, 9, 10, 17, 17, 20]
val () = print (Int.toString (rod_cutting (prices, 8)) ^ "\n")
val () = print (Int.toString (rod_cutting (prices, 4)) ^ "\n")
