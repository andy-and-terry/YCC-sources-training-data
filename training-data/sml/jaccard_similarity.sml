fun mem x xs = List.exists (fn y => y = x) xs
fun uniq xs = foldr (fn (x, acc) => if mem x acc then acc else x :: acc) [] xs

fun jaccard (a, b) =
  let
    val ua = uniq a
    val inter = List.filter (fn x => mem x b) ua
    val union = uniq (a @ b)
  in
    real (length inter) / real (length union)
  end

val () = print (Real.fmt (StringCvt.FIX (SOME 2)) (jaccard ([1, 2, 3, 4], [3, 4, 5])) ^ "\n")
