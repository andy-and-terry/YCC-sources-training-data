fun recaman count =
  let
    fun go (i, prev, seen, acc) =
      if i >= count then rev acc
      else
        let
          val c = prev - i
          val next =
            if c > 0 andalso not (List.exists (fn x => x = c) seen)
            then c else prev + i
        in
          go (i + 1, next, next :: seen, next :: acc)
        end
  in
    go (1, 0, [0], [0])
  end

val () =
  print (String.concatWith " " (map Int.toString (recaman 20)) ^ "\n")
