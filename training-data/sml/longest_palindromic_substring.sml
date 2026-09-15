fun expand (s, left, right) =
  if left >= 0 andalso right < String.size s andalso String.sub (s, left) = String.sub (s, right) then
    expand (s, left - 1, right + 1)
  else
    (left + 1, right - 1)

fun longest_palindromic_substring s =
  let
    val n = String.size s
    fun best_at (i, (bestStart, bestLen)) =
      let
        val (l1, r1) = expand (s, i, i)
        val len1 = r1 - l1 + 1
        val (l2, r2) = expand (s, i, i + 1)
        val len2 = if i + 1 < n then r2 - l2 + 1 else 0
        val (start, len) = if len1 >= len2 then (l1, len1) else (l2, len2)
      in
        if len > bestLen then (start, len) else (bestStart, bestLen)
      end
    fun loop (i, acc) =
      if i = n then acc else loop (i + 1, best_at (i, acc))
    val (start, len) = loop (0, (0, if n > 0 then 1 else 0))
  in
    String.substring (s, start, len)
  end

val () = print (longest_palindromic_substring "babad" ^ "\n")
val () = print (longest_palindromic_substring "cbbd" ^ "\n")
