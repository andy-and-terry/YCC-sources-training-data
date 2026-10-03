(* Sparse table for O(1) range-minimum queries after O(n log n)
   preprocessing, using overlapping power-of-two blocks. *)
fun log2_floor n =
  let fun go (v, acc) = if v <= 1 then acc else go (v div 2, acc + 1)
  in go (n, 0) end

fun pow2 j = if j <= 0 then 1 else 2 * pow2 (j - 1)

fun build_sparse_table arr =
  let
    val n = Array.length arr
    val k = log2_floor n + 1
    val table = Array.tabulate (k, fn _ => Array.array (n, 0))
    val () =
      List.app (fn i => Array.update (Array.sub (table, 0), i, Array.sub (arr, i))) (List.tabulate (n, fn i => i))
    val () =
      List.app
        (fn j =>
          List.app
            (fn i =>
              if i + (pow2 j) <= n then
                let
                  val left = Array.sub (Array.sub (table, j - 1), i)
                  val right = Array.sub (Array.sub (table, j - 1), i + (pow2 (j - 1)))
                in
                  Array.update (Array.sub (table, j), i, Int.min (left, right))
                end
              else ())
            (List.tabulate (n, fn i => i)))
        (List.tabulate (k - 1, fn x => x + 1))
  in
    table
  end

fun query_min (table, l, r) =
  let
    val len = r - l + 1
    val j = log2_floor len
    val left = Array.sub (Array.sub (table, j), l)
    val right = Array.sub (Array.sub (table, j), r - (pow2 j) + 1)
  in
    Int.min (left, right)
  end

val arr = Array.fromList [5, 2, 4, 7, 1, 3, 6, 0, 8]
val table = build_sparse_table arr
val () = print (Int.toString (query_min (table, 1, 5)) ^ "\n")
val () = print (Int.toString (query_min (table, 0, 8)) ^ "\n")
