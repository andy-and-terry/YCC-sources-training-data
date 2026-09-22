fun word_break (s, dict) =
  let
    val n = String.size s
    val dp = Array.array (n + 1, false)
    val () = Array.update (dp, 0, true)
    fun substr (i, j) = String.substring (s, i, j - i)
    val () =
      List.app
        (fn i =>
          List.app
            (fn j =>
              if (not (Array.sub (dp, i))) andalso Array.sub (dp, j)
                 andalso List.exists (fn w => w = substr (j, i)) dict
              then Array.update (dp, i, true)
              else ())
            (List.tabulate (i, fn j => j)))
        (List.tabulate (n + 1, fn i => i))
  in
    Array.sub (dp, n)
  end

val dict = ["sml", "is", "fun", "lang"]

val () = print (Bool.toString (word_break ("smlisfun", dict)) ^ "\n")
val () = print (Bool.toString (word_break ("smllang", dict)) ^ "\n")
val () = print (Bool.toString (word_break ("nope", dict)) ^ "\n")
