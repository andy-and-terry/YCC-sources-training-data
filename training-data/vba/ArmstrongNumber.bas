Function IsArmstrong(n As Long) As Boolean
    Dim digitsStr As String, power As Long, total As Long, i As Long, d As Long
    digitsStr = CStr(n)
    power = Len(digitsStr)
    total = 0
    For i = 1 To Len(digitsStr)
        d = CLng(Mid(digitsStr, i, 1))
        total = total + d ^ power
    Next i
    IsArmstrong = (total = n)
End Function

Sub Main()
    Debug.Print IsArmstrong(153)
    Debug.Print IsArmstrong(154)
End Sub
