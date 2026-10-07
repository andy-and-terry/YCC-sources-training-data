val x = 10

fun f () =
    let
        val x = 20
        val y = x * 2
    in
        let val x = y + 1 in x end
    end

val () = print (Int.toString (f ()) ^ "\n")
val () = print (Int.toString x ^ "\n")

val z = let val a = 3 val b = 4 in a * a + b * b end
val () = print (Int.toString z ^ "\n")

val (q, r) = let val n = 17 in (n div 5, n mod 5) end
val () = print (Int.toString q ^ " " ^ Int.toString r ^ "\n")

fun counter n =
    let
        fun loop (i, acc) = if i > n then acc else loop (i + 1, acc + i)
    in
        loop (1, 0)
    end
val () = print (Int.toString (counter 100) ^ "\n")

val g = fn x => let val x = x + 1 in x * x end
val () = print (Int.toString (g 4) ^ "\n")
