Private Function CentralDelannoy(ByVal n As Long) As Long
    Dim g() As Long, i As Long, j As Long
    ReDim g(0 To n, 0 To n)
    For i = 0 To n
        For j = 0 To n
            If i = 0 Or j = 0 Then
                g(i, j) = 1
            Else
                g(i, j) = g(i - 1, j) + g(i, j - 1) + g(i - 1, j - 1)
            End If
        Next j
    Next i
    CentralDelannoy = g(n, n)
End Function

Sub PrintDelannoy()
    Dim n As Long, s As String
    For n = 0 To 5
        s = s & CentralDelannoy(n) & " "
    Next n
    Debug.Print s ' 1 3 13 63 321 1683
End Sub
