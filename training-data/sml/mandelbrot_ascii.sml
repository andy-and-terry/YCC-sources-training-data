fun escape cr ci =
  let
    fun go zr zi n =
      if n = 30 orelse zr * zr + zi * zi >= 4.0 then n
      else go (zr * zr - zi * zi + cr) (2.0 * zr * zi + ci) (n + 1)
  in go 0.0 0.0 0 end

fun row yi =
  String.implode (List.tabulate (53, fn j =>
    if escape (Real.fromInt (j - 40) / 20.0) (Real.fromInt yi / 5.0) = 30 then #"#" else #"."))

val () = List.app (fn yi => print (row yi ^ "\n")) (List.tabulate (11, fn i => i - 5))
