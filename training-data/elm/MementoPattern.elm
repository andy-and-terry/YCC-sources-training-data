module MementoPattern exposing (Editor, save, undo)

{-| The Gang-of-Four Memento pattern needs no separate memento/caretaker
classes in Elm: a snapshot is just a copy of the record's own fields, and
the "caretaker" that remembers past snapshots is a plain list acting as an
undo stack.
-}


type alias Editor =
    { content : String
    , history : List String
    }


save : String -> Editor -> Editor
save newContent editor =
    { editor | content = newContent, history = editor.content :: editor.history }


undo : Editor -> Editor
undo editor =
    case editor.history of
        [] ->
            editor

        previous :: rest ->
            { editor | content = previous, history = rest }
