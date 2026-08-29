fun sieve limit =
  let
    val isComposite = Array.array (limit + 1, false)
    fun markMultiples i =
      if i * i > limit then ()
      else
        (if not (Array.sub (isComposite, i)) then
           let
             fun mark j = if j > limit then () else (Array.update (isComposite, j, true); mark (j + i))
           in
             mark (i * i)
           end
         else ();
         markMultiples (i + 1))
    val () = markMultiples 2
  in
    List.filter (fn n => not (Array.sub (isComposite, n))) (List.tabulate (limit - 1, fn i => i + 2))
  end

val () = print (String.concatWith " " (map Int.toString (sieve 50)) ^ "\n")
