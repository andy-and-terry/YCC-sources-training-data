Sub DictionaryDemo()
    Dim d As Object
    Set d = CreateObject("Scripting.Dictionary")
    d.Add "apple", 1
    d.Add "banana", 2
    d.Add "cherry", 3

    Dim key As Variant
    For Each key In d.Keys
        Debug.Print key, d(key)
    Next key
End Sub

Sub Main()
    DictionaryDemo
End Sub
