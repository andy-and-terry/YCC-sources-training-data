Function SumDigits(ByVal n As Long) As Long
    If n < 10 Then
        SumDigits = n
    Else
        SumDigits = (n Mod 10) + SumDigits(n \ 10)
    End If
End Function

Function Power(ByVal b As Double, ByVal e As Long) As Double
    If e = 0 Then
        Power = 1
    ElseIf e Mod 2 = 0 Then
        Power = Power(b * b, e \ 2)
    Else
        Power = b * Power(b, e - 1)
    End If
End Function

Sub Main()
    Debug.Print SumDigits(98765)
    Debug.Print Power(2, 10)
    Debug.Print Power(1.5, 3)
End Sub
