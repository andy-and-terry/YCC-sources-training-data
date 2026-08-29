fun build_lps pattern =
  let
    val n = String.size pattern
    val lps = Array.array (n, 0)
    fun loop (len, i) =
      if i >= n then ()
      else if String.sub (pattern, i) = String.sub (pattern, len) then
        (Array.update (lps, i, len + 1); loop (len + 1, i + 1))
      else if len <> 0 then loop (Array.sub (lps, len - 1), i)
      else (Array.update (lps, i, 0); loop (0, i + 1))
    val () = loop (0, 1)
  in
    lps
  end

fun kmp_search (text, pattern) =
  let
    val lps = build_lps pattern
    val n = String.size text
    val m = String.size pattern
    fun loop (i, j) =
      if i >= n then ~1
      else if String.sub (text, i) = String.sub (pattern, j) then
        if j + 1 = m then i - j else loop (i + 1, j + 1)
      else if j > 0 then loop (i, Array.sub (lps, j - 1))
      else loop (i + 1, 0)
  in
    loop (0, 0)
  end

val () = print (Int.toString (kmp_search ("abxabcabcaby", "abcaby")) ^ "\n")
