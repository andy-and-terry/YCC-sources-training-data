type person = { name : string, age : int }
fun greet ({ name, age } : person) = name ^ " is " ^ Int.toString age
val _ = print (greet { name = "Ann", age = 30 } ^ "\n")
