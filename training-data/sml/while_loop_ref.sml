fun sumTo n =
  let
    val i = ref 1
    val acc = ref 0
  in
    while !i <= n do (
      acc := !acc + !i;
      i := !i + 1
    );
    !acc
  end

val () = print (Int.toString (sumTo 100) ^ "\n")
