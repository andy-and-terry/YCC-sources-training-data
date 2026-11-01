Sub DictionaryDemo()
    Dim d As Object
    Set d = CreateObject("Scripting.Dictionary")
    d("apple") = 3
    d("pear") = 5
    Dim k As Variant
    For Each k In d.Keys
        Debug.Print k & "=" & d(k)
    Next k
    Debug.Print d.Exists("fig"), d.Count
End Sub
