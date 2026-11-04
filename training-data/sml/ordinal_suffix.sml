fun ordinal n =
  let
    val r100 = n mod 100
    val r10 = n mod 10
    val suffix =
      if r100 >= 11 andalso r100 <= 13 then "th"
      else case r10 of 1 => "st" | 2 => "nd" | 3 => "rd" | _ => "th"
  in Int.toString n ^ suffix end

val () = print (String.concatWith " " (map ordinal [1,2,3,4,11,12,13,21,101,111]) ^ "\n")
