Sub Demo()
    Dim d As Object: Set d = CreateObject("Scripting.Dictionary")
    d("a") = 1: d("b") = 2
    Dim k As Variant
    For Each k In d.Keys: Debug.Print k, d(k): Next k
    Debug.Print d.Exists("z")
End Sub
