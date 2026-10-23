Sub Main()
    Dim u(0 To 14) As Long
    Dim length As Long, candidate As Long, ways As Long
    Dim i As Long, j As Long, result As String
    u(0) = 1
    u(1) = 2
    length = 2
    candidate = 3
    Do While length < 15
        ways = 0
        For i = 0 To length - 2
            For j = i + 1 To length - 1
                If u(i) + u(j) = candidate Then ways = ways + 1
            Next j
        Next i
        If ways = 1 Then
            u(length) = candidate
            length = length + 1
        End If
        candidate = candidate + 1
    Loop
    result = CStr(u(0))
    For i = 1 To 14
        result = result & " " & u(i)
    Next i
    Debug.Print result
End Sub
