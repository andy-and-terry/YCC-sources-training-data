(* Dutch national flag partitioning: in-place 3-way partition of an
   array of 0/1/2 values around pivot 1, using low/mid/high
   pointers. *)
fun dutch_flag arr =
  let
    val n = Array.length arr
    fun swap (i, j) =
      let
        val tmp = Array.sub (arr, i)
      in
        Array.update (arr, i, Array.sub (arr, j));
        Array.update (arr, j, tmp)
      end
    fun go (low, mid, high) =
      if mid > high then ()
      else
        case Array.sub (arr, mid) of
          0 => (swap (low, mid); go (low + 1, mid + 1, high))
        | 1 => go (low, mid + 1, high)
        | _ => (swap (mid, high); go (low, mid, high - 1))
  in
    go (0, 0, n - 1)
  end

val arr = Array.fromList [2, 0, 1, 1, 0, 2, 1, 0, 2]
val () = dutch_flag arr
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] arr)) ^ "\n")
