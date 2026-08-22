fun bubbleSort arr =
  let
    val a = Array.tabulate (Array.length arr, fn i => Array.sub (arr, i))
    val n = Array.length a

    fun swap (i, j) =
      let val temp = Array.sub (a, i) in
        Array.update (a, i, Array.sub (a, j));
        Array.update (a, j, temp)
      end

    fun innerLoop j =
      if j >= n - 1 then ()
      else (
        if Array.sub (a, j) > Array.sub (a, j + 1) then swap (j, j + 1) else ();
        innerLoop (j + 1)
      )

    fun outerLoop i =
      if i >= n then ()
      else (
        innerLoop 0;
        outerLoop (i + 1)
      )
  in
    outerLoop 0;
    a
  end

val () =
  let
    val sorted = bubbleSort (Array.fromList [5, 2, 9, 1, 5, 6])
  in
    print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] sorted)) ^ "\n")
  end
