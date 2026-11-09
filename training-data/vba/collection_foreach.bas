Sub CollDemo()
    Dim c As New Collection, v As Variant
    c.Add "one", "k1"
    c.Add "two", "k2"
    For Each v In c
        Debug.Print v
    Next v
    Debug.Print c("k2"), c.Count
End Sub
