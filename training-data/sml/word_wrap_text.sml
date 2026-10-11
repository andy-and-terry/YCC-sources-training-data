fun wrap (width, text) =
  let
    val words = String.tokens Char.isSpace text
    fun go ([], line, acc) = List.rev (if line = "" then acc else line :: acc)
      | go (w :: ws, line, acc) =
          if line = "" then go (ws, w, acc)
          else if size line + 1 + size w <= width then go (ws, line ^ " " ^ w, acc)
          else go (ws, w, line :: acc)
  in
    go (words, "", [])
  end

val () = List.app (fn l => print (l ^ "\n"))
  (wrap (20, "the quick brown fox jumps over the lazy dog again and again"))
