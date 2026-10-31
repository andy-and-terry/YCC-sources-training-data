fun cubeFromOdds n =
  let
    val start = n * n - n + 1
    fun go i acc = if i = n then acc else go (i + 1) (acc + start + 2 * i)
  in
    go 0 0
  end

val () = List.app (fn n =>
  print (Int.toString n ^ " " ^ Int.toString (cubeFromOdds n) ^ " "
         ^ Bool.toString (cubeFromOdds n = n * n * n) ^ "\n")) [1, 2, 3, 4, 5]
