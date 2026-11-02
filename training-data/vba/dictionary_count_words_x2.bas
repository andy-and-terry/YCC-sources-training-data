Sub DictionaryCountWords()
    Dim d As Object, w As Variant
    Set d = CreateObject("Scripting.Dictionary")
    For Each w In Split("a b a c a", " ")
        d(w) = d(w) + 1
    Next
    Dim k As Variant
    For Each k In d.Keys
        Debug.Print k, d(k)
    Next
End Sub
