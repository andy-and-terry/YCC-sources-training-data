fun kolakoski count =
  let
    val s = Array.array (count + 2, 0)
    fun put (pos, value, 0) = pos
      | put (pos, value, k) = (Array.update (s, pos, value); put (pos + 1, value, k - 1))
    fun fill (len, i) =
      if len >= count then ()
      else
        let
          val value = 3 - Array.sub (s, len - 1)
          val run = Array.sub (s, i)
        in
          fill (put (len, value, run), i + 1)
        end
  in
    Array.update (s, 0, 1);
    Array.update (s, 1, 2);
    Array.update (s, 2, 2);
    fill (3, 2);
    List.tabulate (count, fn k => Array.sub (s, k))
  end

val () =
  print (String.concatWith " " (map Int.toString (kolakoski 20)) ^ "\n")
