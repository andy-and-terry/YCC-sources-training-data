Function DigitSum(n As Long) As Long
    Dim total As Long
    total = 0
    Do While n > 0
        total = total + (n Mod 10)
        n = n \ 10
    Loop
    DigitSum = total
End Function

Sub Main()
    Debug.Print DigitSum(12345)
End Sub
