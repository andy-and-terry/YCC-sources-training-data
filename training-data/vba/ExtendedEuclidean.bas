Function ExtendedGcd(a As Long, b As Long, ByRef x As Long, ByRef y As Long) As Long
    If b = 0 Then
        x = 1
        y = 0
        ExtendedGcd = a
        Exit Function
    End If
    Dim x1 As Long, y1 As Long, g As Long
    g = ExtendedGcd(b, a Mod b, x1, y1)
    x = y1
    y = x1 - (a \ b) * y1
    ExtendedGcd = g
End Function

Sub Main()
    Dim x As Long, y As Long, g As Long
    g = ExtendedGcd(30, 20, x, y)
    Debug.Print "gcd=" & g & " x=" & x & " y=" & y

    Dim x2 As Long, y2 As Long, g2 As Long
    g2 = ExtendedGcd(35, 15, x2, y2)
    Debug.Print "gcd=" & g2 & " x=" & x2 & " y=" & y2
    Debug.Print "check=" & (35 * x2 + 15 * y2)
End Sub
