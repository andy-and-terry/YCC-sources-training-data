(* Look-and-say sequence: describe the previous term by counting runs. *)

fun runs [] = []
  | runs (c :: cs) =
      let
        fun go (cur, n, []) = [(cur, n)]
          | go (cur, n, x :: xs) =
              if x = cur then go (cur, n + 1, xs)
              else (cur, n) :: go (x, 1, xs)
      in
        go (c, 1, cs)
      end

fun next term =
  String.concat
    (List.map (fn (c, n) => Int.toString n ^ str c) (runs (String.explode term)))

fun terms (_, 0) = []
  | terms (t, n) = t :: terms (next t, n - 1)

val () =
  List.app (fn t => print (t ^ "\n")) (terms ("1", 8))

val () = print (Int.toString (String.size (List.last (terms ("1", 12)))) ^ "\n")
