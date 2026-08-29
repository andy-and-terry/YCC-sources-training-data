datatype trie = Trie of (char * trie) list * bool

fun empty_trie () = Trie ([], false)

fun trie_insert (Trie (children, isEnd), []) = Trie (children, true)
  | trie_insert (Trie (children, isEnd), c :: rest) =
      let
        val child = case List.find (fn (ch, _) => ch = c) children of
                      SOME (_, t) => t
                    | NONE => empty_trie ()
        val newChild = trie_insert (child, rest)
        val newChildren = (c, newChild) :: List.filter (fn (ch, _) => ch <> c) children
      in
        Trie (newChildren, isEnd)
      end

fun trie_contains (Trie (_, isEnd), []) = isEnd
  | trie_contains (Trie (children, _), c :: rest) =
      case List.find (fn (ch, _) => ch = c) children of
        SOME (_, t) => trie_contains (t, rest)
      | NONE => false

val trie = trie_insert (trie_insert (empty_trie (), String.explode "cat"), String.explode "car")
val () = print (Bool.toString (trie_contains (trie, String.explode "cat")) ^ "\n")
val () = print (Bool.toString (trie_contains (trie, String.explode "ca")) ^ "\n")
