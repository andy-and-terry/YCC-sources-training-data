' Euler zigzag numbers via the Seidel-Entringer boustrophedon.
Public Sub EulerZigzagNumbers()
    Dim row(0 To 15) As Long, nxt(0 To 15) As Long
    Dim i As Long, j As Long, length As Long, out As String
    row(0) = 1
    length = 1
    out = "1 "
    For i = 1 To 9
        nxt(0) = 0
        For j = 1 To length
            nxt(j) = nxt(j - 1) + row(length - j)
        Next j
        length = length + 1
        For j = 0 To length - 1
            row(j) = nxt(j)
        Next j
        out = out & row(length - 1) & " "
    Next i
    Debug.Print Trim$(out)
End Sub
