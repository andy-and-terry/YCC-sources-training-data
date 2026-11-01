type person = { name : string, age : int }
val p : person = { name = "Ann", age = 30 }
val older = { name = #name p, age = #age p + 1 }
val (a, b) = (1, "two")
val () = print (#name older ^ " " ^ Int.toString (#age older) ^ " " ^ Int.toString a ^ b ^ "\n")
