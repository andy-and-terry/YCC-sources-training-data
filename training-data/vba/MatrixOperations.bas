Sub Transpose(matrix() As Long, rows As Long, cols As Long, result() As Long)
    Dim r As Long, c As Long
    For r = 0 To rows - 1
        For c = 0 To cols - 1
            result(c, r) = matrix(r, c)
        Next c
    Next r
End Sub

Sub Main()
    Dim a(1, 1) As Long
    a(0, 0) = 1: a(0, 1) = 2: a(1, 0) = 3: a(1, 1) = 4
    Dim t(1, 1) As Long
    Transpose a, 2, 2, t
    Dim i As Long, j As Long
    For i = 0 To 1
        For j = 0 To 1
            Debug.Print t(i, j);
        Next j
    Next i
End Sub
