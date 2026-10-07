fun order_to_string LESS = "LESS"
  | order_to_string EQUAL = "EQUAL"
  | order_to_string GREATER = "GREATER"

val () = print (order_to_string (Int.compare (3, 7)) ^ " ")
val () = print (order_to_string (String.compare ("pear", "apple")) ^ " ")
val () = print (order_to_string (Real.compare (2.0, 2.0)) ^ " ")
val () = print (order_to_string (Char.compare (#"a", #"b")) ^ "\n")

fun insert cmp (x, []) = [x]
  | insert cmp (x, l as y :: ys) =
      case cmp (x, y) of
        GREATER => y :: insert cmp (x, ys)
      | _ => x :: l

fun sort_by cmp xs = foldl (insert cmp) [] xs

fun reverse_order cmp (a, b) = cmp (b, a)

fun by_length (a, b) = Int.compare (size a, size b)

fun then_by (first, second) (a, b) =
  case first (a, b) of
    EQUAL => second (a, b)
  | other => other

val words = ["fig", "banana", "kiwi", "apple", "date"]

val () = print (String.concatWith " " (sort_by String.compare words) ^ "\n")
val () = print (String.concatWith " " (sort_by (reverse_order String.compare) words) ^ "\n")
val () = print (String.concatWith " " (sort_by (then_by (by_length, String.compare)) words) ^ "\n")

val people = [("Cy", 30), ("Ann", 25), ("Bob", 30)]
fun by_age_desc ((_, a), (_, b)) = Int.compare (b, a)
fun by_name ((a, _), (b, _)) = String.compare (a, b)
val sorted = sort_by (then_by (by_age_desc, by_name)) people
val () = print (String.concatWith " " (map (fn (n, a) => n ^ ":" ^ Int.toString a) sorted) ^ "\n")

val () = print (Bool.toString (String.< ("a", "b")) ^ "\n")
