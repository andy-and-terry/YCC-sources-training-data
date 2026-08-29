Sub CollectionDemo()
    Dim col As New Collection
    col.Add "Alice"
    col.Add "Bob"
    col.Add "Carol"

    Dim item As Variant
    For Each item In col
        Debug.Print item
    Next item

    Debug.Print col.Count
    col.Remove 2
    Debug.Print col.Count
End Sub

Sub Main()
    CollectionDemo
End Sub
