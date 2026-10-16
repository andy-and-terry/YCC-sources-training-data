fun repeat (s, n) = String.concat (List.tabulate (n, fn _ => s))

fun box w =
  let
    val bar = "+" ^ repeat ("-", w) ^ "+\n"
    val mid = "|" ^ repeat (" ", w) ^ "|\n"
  in
    bar ^ mid ^ bar
  end

val () = print (box 8)
