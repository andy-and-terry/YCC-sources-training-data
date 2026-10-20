Sub CollectionAndDictionary()
    Dim col As New Collection
    col.Add "alpha", "a"
    col.Add "beta", "b"
    col.Add "gamma"
    Debug.Print col.Count, col("a"), col(3)
    col.Remove 2
    Dim v As Variant
    For Each v In col
        Debug.Print v
    Next v

    Dim d As Object
    Set d = CreateObject("Scripting.Dictionary")
    d.Add "x", 1
    d("y") = 2
    d("x") = d("x") + 10
    If d.Exists("y") Then Debug.Print "has y"
    Dim k As Variant
    For Each k In d.Keys
        Debug.Print k & "=" & d(k)
    Next k
    Debug.Print d.Count, d.Items()(0)
    d.Remove "x"
End Sub
