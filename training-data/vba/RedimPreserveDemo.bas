Sub Main()
    Dim items() As String
    Dim count As Long
    Dim i As Long

    ReDim items(0 To 0)
    Dim words As Variant
    words = Array("alpha", "beta", "gamma", "delta")

    For i = LBound(words) To UBound(words)
        If count > UBound(items) Then
            ReDim Preserve items(0 To count)
        End If
        items(count) = words(i)
        count = count + 1
    Next i

    Debug.Print "Size: " & (UBound(items) - LBound(items) + 1)
    For i = LBound(items) To UBound(items)
        Debug.Print i & ": " & items(i)
    Next i

    Erase items
End Sub
