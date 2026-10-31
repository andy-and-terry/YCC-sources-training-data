fun isSelfDescribing s =
  let
    val cs = String.explode s
    fun count c = length (List.filter (fn x => x = c) cs)
    fun check _ [] = true
      | check i (d :: rest) =
          count (Char.chr (Char.ord #"0" + i)) = Char.ord d - Char.ord #"0"
          andalso check (i + 1) rest
  in
    check 0 cs
  end

val () = List.app (fn s => print (s ^ " " ^ Bool.toString (isSelfDescribing s) ^ "\n"))
  ["1210", "2020", "21200", "1211"]
