fun hofstadterQ count =
  let
    val q = Array.array (count + 1, 1)
    fun get i = Array.sub (q, i)
    fun fill n =
      if n > count then ()
      else (Array.update (q, n, get (n - get (n - 1)) + get (n - get (n - 2)));
            fill (n + 1))
  in
    fill 3;
    List.tabulate (count, fn i => get (i + 1))
  end

val () =
  print (String.concatWith " " (map Int.toString (hofstadterQ 20)) ^ "\n")
