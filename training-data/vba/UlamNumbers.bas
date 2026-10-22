Sub Main()
    Dim terms(0 To 14) As Long
    Dim length As Long, c As Long, ways As Long
    Dim i As Long, j As Long, result As String
    terms(0) = 1
    terms(1) = 2
    length = 2
    c = 3
    Do While length < 15
        ways = 0
        For i = 0 To length - 2
            For j = i + 1 To length - 1
                If terms(i) + terms(j) = c Then ways = ways + 1
            Next j
        Next i
        If ways = 1 Then
            terms(length) = c
            length = length + 1
        End If
        c = c + 1
    Loop
    result = CStr(terms(0))
    For i = 1 To 14
        result = result & " " & terms(i)
    Next i
    Debug.Print result
End Sub
