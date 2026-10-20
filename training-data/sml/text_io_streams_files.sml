val file = OS.FileSys.tmpName ()
val out = TextIO.openOut file
val _ = TextIO.output (out, "line one\nline two\n42 17\n")
val _ = TextIO.closeOut out
val ins = TextIO.openIn file
fun readLines s = case TextIO.inputLine s of NONE => [] | SOME l => l :: readLines s
val lines = readLines ins
val _ = TextIO.closeIn ins
val _ = print (Int.toString (length lines) ^ "\n")
val _ = app (fn l => print ("> " ^ String.substring (l, 0, size l - 1) ^ "\n")) lines
val nums = map (valOf o Int.fromString) (String.tokens Char.isSpace (List.last lines))
val _ = print (Int.toString (foldl op+ 0 nums) ^ "\n")
val app' = TextIO.openAppend file
val _ = TextIO.output (app', "appended\n")
val _ = TextIO.closeOut app'
val ins2 = TextIO.openIn file
val all = TextIO.inputAll ins2
val _ = TextIO.closeIn ins2
val _ = print (Int.toString (size all) ^ "\n")
val _ = OS.FileSys.remove file
val _ = print (Bool.toString (OS.FileSys.access (file, [])) ^ "\n")
val _ = TextIO.print "done\n"
