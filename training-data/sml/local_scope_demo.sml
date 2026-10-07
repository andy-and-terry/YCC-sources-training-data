local
  fun mean xs = List.foldl (op +) 0.0 xs / real (length xs)

  fun variance xs =
    let
      val m = mean xs
    in
      List.foldl (fn (x, acc) => acc + (x - m) * (x - m)) 0.0 xs / real (length xs)
    end
in
  fun standard_deviation xs = Math.sqrt (variance xs)
end

val () = print (Real.toString (standard_deviation [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]) ^ "\n")
val () = print (Real.toString (standard_deviation [10.0, 10.0, 10.0]) ^ "\n")
