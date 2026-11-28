fun isPrime n =
  let fun go i = i * i > n orelse (n mod i <> 0 andalso go (i + 1))
  in n >= 2 andalso go 2 end

fun cuban (y, found, acc) =
  if found = 8 then rev acc
  else
    let val p = 3 * y * y + 3 * y + 1
    in if isPrime p then cuban (y + 1, found + 1, p :: acc)
       else cuban (y + 1, found, acc)
    end

val () = print (String.concatWith " " (map Int.toString (cuban (1, 0, []))) ^ "\n")
