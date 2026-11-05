type person = {name : string, age : int}

fun older ({name, age} : person) = {name = name, age = age + 1}

val p = {name = "ann", age = 30}
val {age = a, ...} = older p
val _ = print (Int.toString a ^ "\n")
val t = (1, "two", 3.0)
val _ = print (#2 t ^ "\n")
