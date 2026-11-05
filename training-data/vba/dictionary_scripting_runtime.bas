Sub WordCount()
    Dim d As Object, w As Variant, k As Variant
    Set d = CreateObject("Scripting.Dictionary")
    For Each w In Split("the cat and the hat and the bat", " ")
        d(w) = d(w) + 1
    Next w
    For Each k In d.Keys
        Debug.Print k & "=" & d(k)
    Next k
End Sub
