fun countLetters s =
    let
        val counts = Array.array (26, 0)
        fun bump c =
            if Char.isAlpha c then
                let val i = Char.ord (Char.toLower c) - Char.ord #"a"
                in Array.update (counts, i, Array.sub (counts, i) + 1) end
            else ()
    in
        (List.app bump (explode s); counts)
    end

val counts = countLetters "Hello, World"

fun report i =
    let val n = Array.sub (counts, i)
    in
        if n > 0
        then print (String.str (Char.chr (i + 97)) ^ ":" ^ Int.toString n ^ " ")
        else ()
    end

val () = List.app report (List.tabulate (26, fn i => i))
val () = print "\n"
