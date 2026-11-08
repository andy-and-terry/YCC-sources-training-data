Function RailFence(s As String, rails As Long) As String
    Dim rows() As String, i As Long, r As Long, dirn As Long
    ReDim rows(0 To rails - 1)
    r = 0: dirn = 1
    For i = 1 To Len(s)
        rows(r) = rows(r) & Mid$(s, i, 1)
        If r = 0 Then dirn = 1
        If r = rails - 1 Then dirn = -1
        r = r + dirn
    Next i
    RailFence = Join(rows, "")
End Function
