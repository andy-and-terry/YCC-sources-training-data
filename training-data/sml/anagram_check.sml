fun normalize s =
  let
    val chars = List.filter (fn c => c <> #" ") (String.explode (String.map Char.toLower s))
  in
    ListMergeSort.sort (fn (a, b) => a > b) chars
  end

fun is_anagram (a, b) = normalize a = normalize b

val () = print (Bool.toString (is_anagram ("listen", "silent")) ^ "\n")
val () = print (Bool.toString (is_anagram ("hello", "world")) ^ "\n")
