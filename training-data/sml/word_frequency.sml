fun word_frequency text =
  let
    val words = String.tokens (fn c => c = #" ") (String.map Char.toLower text)
    fun addWord (w, freq) =
      case List.find (fn (word, _) => word = w) freq of
        SOME (word, count) => (word, count + 1) :: List.filter (fn (word2, _) => word2 <> w) freq
      | NONE => (w, 1) :: freq
  in
    foldl addWord [] words
  end

val () = print (Int.toString (length (word_frequency "the quick brown fox the lazy fox")) ^ "\n")
