Object subclass: EditorMemento [
    | text |
    text: t [ text := t ]
    text [ ^text ]
]

Object subclass: TextEditor [
    | text |
    TextEditor class >> new [ | e | e := super new. e setText. ^e ]
    setText [ text := '' ]
    type: aString [ text := text, aString ]
    text [ ^text ]
    save [ ^EditorMemento new text: text; yourself ]
    restore: aMemento [ text := aMemento text ]
]

| editor saved |
editor := TextEditor new.
editor type: 'Hello'.
saved := editor save.
editor type: ', world'.
Transcript showCr: editor text.
editor restore: saved.
Transcript showCr: editor text.
