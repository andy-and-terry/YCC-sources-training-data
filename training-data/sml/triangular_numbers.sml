(* Triangular numbers: closed form, running sum, and a membership test. *)

fun tri n = n * (n + 1) div 2

fun triList n = List.tabulate (n, fn i => tri (i + 1))

fun isqrt n =
  let
    fun go r = if (r + 1) * (r + 1) > n then r else go (r + 1)
  in
    go 0
  end

(* n is triangular iff 8n + 1 is a perfect square *)
fun isTriangular n =
  let
    val d = 8 * n + 1
    val r = isqrt d
  in
    r * r = d
  end

fun showList xs = "[" ^ String.concatWith ", " (List.map Int.toString xs) ^ "]"

val () = print (showList (triList 10) ^ "\n")
val () = print (Int.toString (tri 100) ^ "\n")
val () = print (showList (List.filter isTriangular (List.tabulate (40, fn i => i + 1))) ^ "\n")

val partial = #2 (foldl (fn (x, (acc, out)) => (acc + x, (acc + x) :: out)) (0, []) [1, 2, 3, 4, 5])
val () = print (showList (rev partial) ^ "\n")
