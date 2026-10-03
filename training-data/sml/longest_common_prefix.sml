(* Longest common prefix shared by all strings in a list. *)
fun common_prefix_two (a, b) =
  let
    val n = Int.min (String.size a, String.size b)
    fun go i = if i < n andalso String.sub (a, i) = String.sub (b, i) then go (i + 1) else i
  in
    String.substring (a, 0, go 0)
  end

fun longest_common_prefix [] = ""
  | longest_common_prefix (first :: rest) =
      List.foldl common_prefix_two first rest

val () = print (longest_common_prefix ["flower", "flow", "flight"] ^ "\n")
val () = print (longest_common_prefix ["dog", "racecar", "car"] ^ "\n")
val () = print (longest_common_prefix ["interspecies", "interstellar", "interstate"] ^ "\n")
