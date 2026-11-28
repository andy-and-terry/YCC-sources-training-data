Public Function AddBinary(a As String, b As String) As String
    Dim i As Long, j As Long, carry As Long, s As Long, result As String
    i = Len(a): j = Len(b)
    Do While i > 0 Or j > 0 Or carry > 0
        s = carry
        If i > 0 Then s = s + CLng(Mid$(a, i, 1)): i = i - 1
        If j > 0 Then s = s + CLng(Mid$(b, j, 1)): j = j - 1
        result = CStr(s Mod 2) & result
        carry = s \ 2
    Loop
    AddBinary = result
End Function

Public Sub DemoAddBinary()
    Debug.Print AddBinary("1010", "1011") ' 10101
End Sub
