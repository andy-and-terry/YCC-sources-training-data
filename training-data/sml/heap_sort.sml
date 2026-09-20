fun sift_down (arr, i, n) =
  let
    val left = 2 * i + 1
    val right = 2 * i + 2
    val largest =
      if left < n andalso Array.sub (arr, left) > Array.sub (arr, i)
      then left else i
    val largest =
      if right < n andalso Array.sub (arr, right) > Array.sub (arr, largest)
      then right else largest
  in
    if largest <> i then
      let
        val tmp = Array.sub (arr, i)
      in
        Array.update (arr, i, Array.sub (arr, largest));
        Array.update (arr, largest, tmp);
        sift_down (arr, largest, n)
      end
    else ()
  end

fun build_heap (arr, n) =
  let
    fun loop i = if i < 0 then () else (sift_down (arr, i, n); loop (i - 1))
  in
    loop (n div 2 - 1)
  end

fun heap_sort arr =
  let
    val n = Array.length arr
    val () = build_heap (arr, n)
    fun loop last =
      if last <= 0 then ()
      else
        let
          val tmp = Array.sub (arr, 0)
        in
          Array.update (arr, 0, Array.sub (arr, last));
          Array.update (arr, last, tmp);
          sift_down (arr, 0, last);
          loop (last - 1)
        end
  in
    loop (n - 1)
  end

val arr = Array.fromList [5, 3, 8, 1, 9, 2, 7]
val () = heap_sort arr
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] arr)) ^ "\n")
