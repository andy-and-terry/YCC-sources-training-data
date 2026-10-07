fun digitAt (n, place) = (n div place) mod 10

fun countingPass (xs, place) =
  let
    val buckets = Array.array (10, [])
    val () =
      app
        (fn x =>
          let val d = digitAt (x, place) in
            Array.update (buckets, d, x :: Array.sub (buckets, d))
          end)
        xs
  in
    List.concat (List.tabulate (10, fn d => rev (Array.sub (buckets, d))))
  end

fun radixSort xs =
  let
    val maxVal = foldl Int.max 0 xs
    fun loop (xs, place) =
      if place > maxVal then xs
      else loop (countingPass (xs, place), place * 10)
  in
    loop (xs, 1)
  end

val () = print (String.concatWith " " (map Int.toString (radixSort [170, 45, 75, 90, 802, 24, 2, 66])) ^ "\n")
