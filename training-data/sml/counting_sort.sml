fun countingSort (xs, maxVal) =
  let
    val counts = Array.array (maxVal + 1, 0)
    val () = app (fn x => Array.update (counts, x, Array.sub (counts, x) + 1)) xs
    fun build (i, acc) =
      if i < 0 then acc
      else build (i - 1, List.tabulate (Array.sub (counts, i), fn _ => i) @ acc)
  in
    build (maxVal, [])
  end

val () = print (String.concatWith " " (map Int.toString (countingSort ([4, 2, 2, 8, 3, 3, 1], 8))) ^ "\n")
