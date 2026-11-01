' Leyland numbers: x^y + y^x for x >= y >= 2.
Function Leyland(x As Long, y As Long) As Double
    Leyland = x ^ y + y ^ x
End Function

Sub PrintLeyland()
    Dim x As Long, y As Long, out As String
    For x = 2 To 4
        For y = 2 To x
            out = out & CStr(Leyland(x, y)) & " "
        Next y
    Next x
    Debug.Print Trim(out)
End Sub
