Function MyGcd(a As Long, b As Long) As Long
    Dim t As Long
    Do While b <> 0
        t = b
        b = a Mod b
        a = t
    Loop
    MyGcd = Abs(a)
End Function

Function MyLcm(a As Long, b As Long) As Long
    MyLcm = Abs(a * b) \ MyGcd(a, b)
End Function

Sub Main()
    Debug.Print MyGcd(48, 18)
    Debug.Print MyLcm(4, 6)
End Sub
