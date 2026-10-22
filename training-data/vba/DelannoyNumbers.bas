Sub Main()
    Dim d(0 To 9, 0 To 9) As Long
    Dim m As Long, n As Long, result As String
    For m = 0 To 9
        For n = 0 To 9
            If m = 0 Or n = 0 Then
                d(m, n) = 1
            Else
                d(m, n) = d(m - 1, n) + d(m, n - 1) + d(m - 1, n - 1)
            End If
        Next n
    Next m
    result = CStr(d(0, 0))
    For m = 1 To 9
        result = result & " " & d(m, m)
    Next m
    Debug.Print result
End Sub
