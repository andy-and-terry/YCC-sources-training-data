Sub Main()
    Dim values() As Long
    Dim count As Long
    Dim i As Long

    ReDim values(0 To 1)
    For i = 1 To 6
        If count > UBound(values) Then
            ReDim Preserve values(0 To UBound(values) * 2 + 1)
            Debug.Print "grew to"; UBound(values) + 1
        End If
        values(count) = i * i
        count = count + 1
    Next i

    ReDim Preserve values(0 To count - 1)
    For i = 0 To UBound(values)
        Debug.Print values(i);
    Next i
    Debug.Print
End Sub
