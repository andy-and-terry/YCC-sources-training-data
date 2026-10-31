Function Cullen(n As Long) As Double
    Cullen = n * 2 ^ n + 1
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 5
        Debug.Print n; Cullen(n)
    Next n
End Sub
