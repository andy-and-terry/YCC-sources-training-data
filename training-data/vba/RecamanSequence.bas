Sub Main()
    Dim seen(0 To 255) As Boolean
    Dim prev As Long, nxt As Long, i As Long, result As String
    prev = 0
    seen(0) = True
    result = "0"
    For i = 1 To 19
        nxt = prev - i
        If nxt <= 0 Then
            nxt = prev + i
        ElseIf seen(nxt) Then
            nxt = prev + i
        End If
        seen(nxt) = True
        prev = nxt
        result = result & " " & nxt
    Next i
    Debug.Print result
End Sub
