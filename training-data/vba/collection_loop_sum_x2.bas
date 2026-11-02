Sub CollectionLoopSum()
    Dim c As New Collection, v As Variant, total As Long
    c.Add 3: c.Add 5: c.Add 7
    For Each v In c
        total = total + v
    Next v
    Debug.Print total
End Sub
