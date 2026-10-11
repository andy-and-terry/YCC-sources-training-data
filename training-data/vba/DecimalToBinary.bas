Function ToBinary(ByVal n As Long) As String
    Dim s As String
    If n = 0 Then
        ToBinary = "0"
        Exit Function
    End If
    Do While n > 0
        s = CStr(n Mod 2) & s
        n = n \ 2
    Loop
    ToBinary = s
End Function

Function ToHex(ByVal n As Long) As String
    Const DIGITS As String = "0123456789ABCDEF"
    Dim s As String
    If n = 0 Then ToHex = "0": Exit Function
    Do While n > 0
        s = Mid$(DIGITS, (n Mod 16) + 1, 1) & s
        n = n \ 16
    Loop
    ToHex = s
End Function

Sub Main()
    Debug.Print ToBinary(10), ToBinary(255), ToBinary(0)
    Debug.Print ToHex(255), ToHex(4096), Hex$(4096)
End Sub
