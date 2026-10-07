(* Reading text with TextIO from an in-memory string. *)
val input = "alpha 1\nbeta 22\n\ngamma 333\n"

fun readLines ins =
  case TextIO.inputLine ins of
    NONE => []
  | SOME line => String.substring (line, 0, size line - 1) :: readLines ins

val lines = readLines (TextIO.openString input)
val () = print (Int.toString (length lines) ^ " lines\n")

fun parse line =
  case String.tokens Char.isSpace line of
    [name, num] => (case Int.fromString num of SOME n => SOME (name, n) | NONE => NONE)
  | _ => NONE

val records = List.mapPartial parse lines
val () = List.app (fn (n, v) => print (n ^ " => " ^ Int.toString v ^ "\n")) records
val () = print ("total: " ^ Int.toString (foldl (fn ((_, v), a) => v + a) 0 records) ^ "\n")

val ins = TextIO.openString "xyz"
val first = TextIO.input1 ins
val rest = TextIO.inputAll ins
val () = print (case first of SOME c => str c | NONE => "?")
val () = print (" then " ^ rest ^ "\n")
val () = TextIO.output (TextIO.stdOut, "written via TextIO.output\n")
val () = TextIO.flushOut TextIO.stdOut
