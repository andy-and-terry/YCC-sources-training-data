fun golomb count =
  let
    val a = Array.array (count + 1, 0)
    val () = Array.update (a, 1, 1)
    fun get i = Array.sub (a, i)
    fun fill n =
      if n > count then ()
      else (Array.update (a, n, 1 + get (n - get (get (n - 1))));
            fill (n + 1))
  in
    fill 2;
    List.tabulate (count, fn i => get (i + 1))
  end

val () =
  print (String.concatWith " " (map Int.toString (golomb 20)) ^ "\n")
