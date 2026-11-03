Attribute VB_Name = "DigitSquareSum"
Option Explicit

Public Function DigitSquareSum(ByVal n As Long) As Long
    Dim total As Long, d As Long
    n = Abs(n)
    Do While n > 0
        d = n Mod 10
        total = total + d * d
        n = n \ 10
    Loop
    DigitSquareSum = total
End Function

Public Sub Demo()
    Debug.Print DigitSquareSum(123), DigitSquareSum(-99)
End Sub
