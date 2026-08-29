fun selection_sort [] = []
  | selection_sort lst =
      let
        val m = foldl Int.min (hd lst) lst
        fun remove_first (x, []) = []
          | remove_first (x, h :: t) = if h = x then t else h :: remove_first (x, t)
      in
        m :: selection_sort (remove_first (m, lst))
      end

val () = print (String.concatWith " " (map Int.toString (selection_sort [5, 3, 8, 1, 9, 2])) ^ "\n")
