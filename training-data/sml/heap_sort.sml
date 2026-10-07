(* Heap sort using an in-place binary max-heap over an Array.array. *)

fun heap_sort arr =
  let
    val n = Array.length arr
    fun swap (i, j) =
      let val tmp = Array.sub (arr, i) in
        Array.update (arr, i, Array.sub (arr, j));
        Array.update (arr, j, tmp)
      end
    fun siftDown (start, size) =
      let
        fun loop root =
          let
            val left = 2 * root + 1
            val right = 2 * root + 2
            val largest =
              (if left < size andalso Array.sub (arr, left) > Array.sub (arr, root)
               then left else root)
            val largest2 =
              (if right < size andalso Array.sub (arr, right) > Array.sub (arr, largest)
               then right else largest)
          in
            if largest2 <> root
            then (swap (root, largest2); loop largest2)
            else ()
          end
      in
        loop start
      end
    fun buildHeap i =
      if i < 0 then () else (siftDown (i, n); buildHeap (i - 1))
    fun sortLoop last =
      if last <= 0 then ()
      else (swap (0, last); siftDown (0, last); sortLoop (last - 1))
    val () = buildHeap (n div 2 - 1)
    val () = sortLoop (n - 1)
  in
    arr
  end

val arr = Array.fromList [5, 3, 8, 1, 9, 2, 7]
val sorted = heap_sort arr
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] sorted)) ^ "\n")
