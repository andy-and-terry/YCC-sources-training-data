Sub Main()
    Dim s(0 To 31) As Long
    Dim length As Long, i As Long, j As Long, value As Long, k As Long
    Dim result As String
    s(0) = 1
    s(1) = 2
    s(2) = 2
    length = 3
    i = 2
    Do While length < 20
        value = 3 - s(length - 1)
        For j = 1 To s(i)
            s(length) = value
            length = length + 1
        Next j
        i = i + 1
    Loop
    result = CStr(s(0))
    For k = 1 To 19
        result = result & " " & s(k)
    Next k
    Debug.Print result
End Sub
