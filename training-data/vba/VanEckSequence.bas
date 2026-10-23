Sub Main()
    Dim t(0 To 19) As Long
    Dim i As Long, j As Long, nxt As Long, result As String
    t(0) = 0
    result = "0"
    For i = 0 To 18
        nxt = 0
        For j = i - 1 To 0 Step -1
            If t(j) = t(i) Then
                nxt = i - j
                Exit For
            End If
        Next j
        t(i + 1) = nxt
        result = result & " " & nxt
    Next i
    Debug.Print result
End Sub
