fun is_valid s =
  let
    fun matches (#")", #"(") = true
      | matches (#"]", #"[") = true
      | matches (#"}", #"{") = true
      | matches _ = false
    fun helper ([], []) = true
      | helper ([], _) = false
      | helper (c :: rest, stack) =
          if c = #"(" orelse c = #"[" orelse c = #"{" then helper (rest, c :: stack)
          else if c = #")" orelse c = #"]" orelse c = #"}" then
            (case stack of
               [] => false
             | top :: stackRest => matches (c, top) andalso helper (rest, stackRest))
          else helper (rest, stack)
  in
    helper (String.explode s, [])
  end

val () = print (Bool.toString (is_valid "{[()]}") ^ "\n")
val () = print (Bool.toString (is_valid "{[(])}") ^ "\n")
