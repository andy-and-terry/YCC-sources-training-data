(* The Substring structure operates on a (string, start, length) view
   instead of copying, which makes trimming and splitting cheap. *)

val raw = "  Hello, World!  "

val trimmed =
  Substring.string
    (Substring.dropr Char.isSpace
      (Substring.dropl Char.isSpace (Substring.full raw)))

val () = print ("[" ^ trimmed ^ "]\n")

val (before, after) =
  Substring.splitl (fn c => c <> #",") (Substring.full trimmed)

val () = print (Substring.string before ^ " | " ^ Substring.string after ^ "\n")
