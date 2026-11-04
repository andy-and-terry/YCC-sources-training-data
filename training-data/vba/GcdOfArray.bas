Attribute VB_Name = "GcdOfArray"
Option Explicit

Public Function Gcd(ByVal a As Long, ByVal b As Long) As Long
    Dim t As Long
    a = Abs(a): b = Abs(b)
    Do While b <> 0
        t = a Mod b
        a = b
        b = t
    Loop
    Gcd = a
End Function

Public Function GcdAll(ParamArray nums() As Variant) As Long
    Dim i As Long, g As Long
    For i = LBound(nums) To UBound(nums)
        g = Gcd(g, CLng(nums(i)))
    Next i
    GcdAll = g
End Function

Public Sub DemoGcd()
    Debug.Print GcdAll(12, 18, 24)
    Debug.Print GcdAll(7, 13)
End Sub
