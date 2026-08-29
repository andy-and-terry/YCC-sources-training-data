fun merge ([], right) = right
  | merge (left, []) = left
  | merge (lx :: ls, rx :: rs) =
      if lx <= rx then lx :: merge (ls, rx :: rs) else rx :: merge (lx :: ls, rs)

fun merge_sort [] = []
  | merge_sort [x] = [x]
  | merge_sort lst =
      let
        val mid = length lst div 2
        val left = List.take (lst, mid)
        val right = List.drop (lst, mid)
      in
        merge (merge_sort left, merge_sort right)
      end

val () = print (String.concatWith " " (map Int.toString (merge_sort [5, 2, 9, 1, 5, 6])) ^ "\n")
