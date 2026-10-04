Sub Main()
    Dim values() As Long
    Dim count As Long
    Dim i As Long

    ReDim values(0 To 0)
    For i = 1 To 5
        If count > UBound(values) Then
            ReDim Preserve values(0 To UBound(values) * 2 + 1)
        End If
        values(count) = i * i
        count = count + 1
    Next i

    ReDim Preserve values(0 To count - 1)
    Debug.Print "count="; count; " ubound="; UBound(values)

    For i = LBound(values) To UBound(values)
        Debug.Print values(i);
    Next i
    Debug.Print

    Erase values
    Debug.Print "erased, dynamic array is empty again"
End Sub
