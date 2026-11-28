Public Sub Main()
    Dim d(0 To 7, 0 To 7) As Long, i As Long, j As Long, out As String
    For i = 0 To 7
        For j = 0 To 7
            If i = 0 Or j = 0 Then
                d(i, j) = 1
            Else
                d(i, j) = d(i - 1, j) + d(i, j - 1) + d(i - 1, j - 1)
            End If
        Next j
        out = out & d(i, i) & " "
    Next i
    Debug.Print out
End Sub
