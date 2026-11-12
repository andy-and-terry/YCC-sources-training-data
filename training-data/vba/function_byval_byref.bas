Sub Inc(ByRef n As Long): n = n + 1: End Sub
Function Dbl(ByVal n As Long) As Long: n = n * 2: Dbl = n: End Function
Sub Demo()
    Dim a As Long: a = 5
    Inc a
    Debug.Print a, Dbl(a), a
End Sub
