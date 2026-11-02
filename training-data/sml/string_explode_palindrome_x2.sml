fun isPal s = let val l = explode s in l = rev l end
val _ = print (Bool.toString (isPal "racecar") ^ "\n")
