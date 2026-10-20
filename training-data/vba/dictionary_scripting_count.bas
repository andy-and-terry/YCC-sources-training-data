Sub CountWords()
    Dim d As Object, w As Variant, k As Variant
    Set d = CreateObject("Scripting.Dictionary")
    For Each w In Split("a b a c b a", " ")
        d(w) = d(w) + 1
    Next w
    For Each k In d.Keys
        Debug.Print k, d(k)
    Next k
End Sub
