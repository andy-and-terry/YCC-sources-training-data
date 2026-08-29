fun is_safe (queens, col) =
  let
    val n = length queens
    fun check (q, i) = q <> col andalso Int.abs (q - col) <> (n - i)
  in
    List.all check (ListPair.zip (queens, List.tabulate (n, fn i => i)))
  end

fun solve (queens, n) =
  if length queens = n then 1
  else
    foldl (fn (col, acc) => if is_safe (queens, col) then acc + solve (queens @ [col], n) else acc) 0 (List.tabulate (n, fn i => i))

val () = print (Int.toString (solve ([], 6)) ^ "\n")
