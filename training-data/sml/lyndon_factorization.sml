fun isLyndon w =
  let val n = String.size w
      fun ok i = i >= n orelse (w < String.extract (w, i, NONE) andalso ok (i + 1))
  in ok 1 end

fun factor "" = []
  | factor s =
    let
      fun longest n = if isLyndon (String.substring (s, 0, n)) then n else longest (n - 1)
      val len = longest (String.size s)
    in String.substring (s, 0, len) :: factor (String.extract (s, len, NONE)) end

val () = print (String.concatWith " " (factor "banana") ^ "\n")
