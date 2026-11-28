Attribute VB_Name = "PollardRho"
Function Gcd(ByVal a As Long, ByVal b As Long) As Long
    Dim t As Long
    Do While b <> 0
        t = a Mod b: a = b: b = t
    Loop
    Gcd = a
End Function

Function Rho(ByVal n As Long) As Long
    Dim x As Double, y As Double, d As Long
    If n Mod 2 = 0 Then Rho = 2: Exit Function
    x = 2: y = 2: d = 1
    Do While d = 1
        x = (x * x + 1) - n * Int((x * x + 1) / n)
        y = (y * y + 1) - n * Int((y * y + 1) / n)
        y = (y * y + 1) - n * Int((y * y + 1) / n)
        d = Gcd(Abs(x - y), n)
    Loop
    Rho = d
End Function

Sub Main()
    Debug.Print "8051 = "; Rho(8051); " * "; 8051 \ Rho(8051)
End Sub
