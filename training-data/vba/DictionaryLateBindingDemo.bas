Sub Main()
    Dim d As Object
    Set d = CreateObject("Scripting.Dictionary")

    d.Add "apple", 3
    d("pear") = 5
    d("apple") = d("apple") + 1

    If d.Exists("pear") Then Debug.Print "pear: " & d("pear")

    Dim k As Variant
    For Each k In d.Keys
        Debug.Print k & " = " & d(k)
    Next k

    d.Remove "pear"
    Debug.Print d.Count
End Sub
