fun chunk (n, xs) =
  let
    fun go ([], acc, cur) = List.rev (if null cur then acc else List.rev cur :: acc)
      | go (x :: rest, acc, cur) =
          if length cur + 1 = n
          then go (rest, List.rev (x :: cur) :: acc, [])
          else go (rest, acc, x :: cur)
  in
    go (xs, [], [])
  end

fun showList xs = "[" ^ String.concatWith "," (map Int.toString xs) ^ "]"

val () = print (String.concatWith " " (map showList (chunk (3, [1,2,3,4,5,6,7,8]))) ^ "\n")
