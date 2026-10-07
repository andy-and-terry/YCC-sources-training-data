(* Kth largest element by keeping a bounded sorted (descending) list
   of size k as elements stream in -- a simple alternative to
   quickselect.sml's partition-based approach. *)
fun insert_sorted_desc (x, []) = [x]
  | insert_sorted_desc (x, y :: rest) =
      if x >= y then x :: y :: rest else y :: insert_sorted_desc (x, rest)

fun kth_largest (xs, k) =
  let
    fun step (x, heap) =
      let
        val inserted = insert_sorted_desc (x, heap)
      in
        if length inserted > k then List.take (inserted, k) else inserted
      end
    val top_k = List.foldl step [] xs
  in
    List.last top_k
  end

val () = print (Int.toString (kth_largest ([3, 2, 1, 5, 6, 4], 2)) ^ "\n")
val () = print (Int.toString (kth_largest ([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)) ^ "\n")
