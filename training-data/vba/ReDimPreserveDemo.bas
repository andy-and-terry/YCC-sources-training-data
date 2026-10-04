Sub Main()
    Dim values() As Long
    Dim count As Long
    Dim i As Long

    ReDim values(0 To 1)
    count = 0

    For i = 1 To 10
        If count > UBound(values) Then
            ReDim Preserve values(0 To UBound(values) * 2 + 1)
            Debug.Print "grew to capacity", UBound(values) + 1
        End If
        values(count) = i * i
        count = count + 1
    Next i

    ReDim Preserve values(0 To count - 1)
    Debug.Print "Final size:", UBound(values) + 1

    Dim total As Long
    For i = LBound(values) To UBound(values)
        total = total + values(i)
    Next i
    Debug.Print "Sum of squares:", total

    Dim grid() As Long
    ReDim grid(1 To 2, 1 To 3)
    grid(2, 3) = 99
    ReDim Preserve grid(1 To 2, 1 To 5)
    Debug.Print "Kept value:", grid(2, 3)
    Debug.Print "Dim sizes:", UBound(grid, 1), UBound(grid, 2)

    Erase values
    On Error Resume Next
    Debug.Print UBound(values)
    Debug.Print "After Erase error:", Err.Number
    On Error GoTo 0
End Sub
