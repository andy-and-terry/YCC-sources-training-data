Sub ShowStern()
    Dim seq(0 To 14) As Long, i As Long, out As String
    seq(0) = 0
    seq(1) = 1
    For i = 2 To 14
        If i Mod 2 = 0 Then
            seq(i) = seq(i \ 2)
        Else
            seq(i) = seq(i \ 2) + seq(i \ 2 + 1)
        End If
    Next i
    For i = 0 To 14
        out = out & seq(i) & " "
    Next i
    Debug.Print out ' 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
End Sub
