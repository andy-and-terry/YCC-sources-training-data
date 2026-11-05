Sub CollectionDemo()
    Dim c As New Collection
    Dim v As Variant
    c.Add "apple"
    c.Add "pear"
    c.Add "fig"
    c.Remove 2
    For Each v In c
        Debug.Print v
    Next v
    Debug.Print c.Count
End Sub
