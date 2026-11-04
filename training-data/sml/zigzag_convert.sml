fun zigzag (s, rows) =
  let
    val n = String.size s
    val period = 2 * (rows - 1)
    fun rowOf i = let val k = i mod period in if k < rows then k else period - k end
    fun pick r = List.filter (fn (i, _) => rowOf i = r) (List.tabulate (n, fn i => (i, String.sub (s, i))))
  in
    if rows = 1 orelse rows >= n then s
    else String.concat (List.concat (List.tabulate (rows, fn r => map (fn (_, c) => str c) (pick r))))
  end

val () = print (zigzag ("PAYPALISHIRING", 3) ^ "\n")
