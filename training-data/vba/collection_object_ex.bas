Sub CollectionDemo()
    Dim c As New Collection
    c.Add "one", "k1"
    c.Add "two", "k2"
    Debug.Print c.Count, c("k2"), c(1)
    Dim v As Variant
    For Each v In c
        Debug.Print v
    Next v
    c.Remove "k1"
End Sub
