Sub Demo()
    Dim c As New Collection, v As Variant
    c.Add "a": c.Add "b": c.Add "c"
    For Each v In c
        Debug.Print v
    Next v
    Debug.Print c.Count
End Sub
