fun slidingWindowMax (arr, k) =
  let
    val n = Array.length arr
    val dq = Array.array (n, 0)
    val front = ref 0
    val back = ref 0
    val result = ref ([] : int list)
    fun trimBack i =
      if !back > !front andalso Array.sub (arr, Array.sub (dq, !back - 1)) <= Array.sub (arr, i)
      then (back := !back - 1; trimBack i)
      else ()
    fun trimFront i =
      if !back > !front andalso Array.sub (dq, !front) <= i - k
      then (front := !front + 1; trimFront i)
      else ()
    fun loop i =
      if i = n then ()
      else
        let
          val () = trimFront i
          val () = trimBack i
          val () = Array.update (dq, !back, i)
          val () = back := !back + 1
        in
          (if i >= k - 1 then result := Array.sub (arr, Array.sub (dq, !front)) :: !result else ());
          loop (i + 1)
        end
  in
    loop 0;
    rev (!result)
  end

val arr = Array.fromList [1, 3, ~1, ~3, 5, 3, 6, 7]
val () = print (String.concatWith " " (map Int.toString (slidingWindowMax (arr, 3))) ^ "\n")
