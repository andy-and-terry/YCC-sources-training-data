Function AlternatingDigitSum(ByVal n As Long) As Long
    Dim total As Long, sign As Long
    sign = 1
    Do While n > 0
        total = total + sign * (n Mod 10)
        sign = -sign
        n = n \ 10
    Loop
    AlternatingDigitSum = total
End Function

Sub Main()
    Debug.Print 1234; AlternatingDigitSum(1234)
    Debug.Print 99999; AlternatingDigitSum(99999)
    Debug.Print 1000; AlternatingDigitSum(1000)
End Sub
