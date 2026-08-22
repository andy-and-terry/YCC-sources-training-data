Function ComputeGcd(ByVal a As Long, ByVal b As Long) As Long
    Dim temp As Long
    Do While b <> 0
        temp = b
        b = a Mod b
        a = temp
    Loop
    ComputeGcd = a
End Function

Sub Main()
    Debug.Print ComputeGcd(48, 18)
    Debug.Print ComputeGcd(100, 75)
End Sub
