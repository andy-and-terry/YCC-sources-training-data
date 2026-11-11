fun addBinary (a, b) =
  let
    fun digits s = rev (map (fn c => ord c - ord #"0") (explode s))
    fun go ([], [], 0, acc) = acc
      | go ([], [], c, acc) = "1" ^ acc
      | go (x :: xs, [], c, acc) = step (x, 0, xs, [], c, acc)
      | go ([], y :: ys, c, acc) = step (0, y, [], ys, c, acc)
      | go (x :: xs, y :: ys, c, acc) = step (x, y, xs, ys, c, acc)
    and step (x, y, xs, ys, c, acc) =
      let val s = x + y + c in go (xs, ys, s div 2, Int.toString (s mod 2) ^ acc) end
  in
    go (digits a, digits b, 0, "")
  end

val _ = print (addBinary ("1010", "1011") ^ "\n") (* 10101 *)
