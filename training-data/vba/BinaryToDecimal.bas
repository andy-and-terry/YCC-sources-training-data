Function BinaryToDecimal(s As String) As Long
    Dim result As Long, i As Long
    result = 0
    For i = 1 To Len(s)
        result = result * 2 + CLng(Mid(s, i, 1))
    Next i
    BinaryToDecimal = result
End Function

Sub Main()
    Debug.Print BinaryToDecimal("1011")
End Sub
