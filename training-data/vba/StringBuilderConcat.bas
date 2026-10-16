Function JoinBuffered(n As Long) As String
    Dim buf As String, pos As Long, piece As String
    Dim i As Long
    buf = Space$(n * 8)
    pos = 1
    For i = 1 To n
        piece = "item" & i & ";"
        Mid$(buf, pos, Len(piece)) = piece
        pos = pos + Len(piece)
    Next i
    JoinBuffered = Left$(buf, pos - 1)
End Function

Sub Main()
    Dim s As String
    s = JoinBuffered(5)
    Debug.Print s
    Debug.Print "Length: " & Len(s)
End Sub
