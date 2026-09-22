fun lis arr =
  let
    val n = Array.length arr
    val dp = Array.array (n, 1)
    fun outer i =
      if i >= n then ()
      else
        let
          fun inner j =
            if j >= i then ()
            else
              (if Array.sub (arr, j) < Array.sub (arr, i)
                 andalso Array.sub (dp, j) + 1 > Array.sub (dp, i)
               then Array.update (dp, i, Array.sub (dp, j) + 1)
               else ();
               inner (j + 1))
        in
          inner 0;
          outer (i + 1)
        end
  in
    outer 0;
    Array.foldl Int.max 0 dp
  end

val () = print (Int.toString (lis (Array.fromList [10, 9, 2, 5, 3, 7, 101, 18])) ^ "\n")
