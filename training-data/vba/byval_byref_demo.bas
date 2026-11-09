Sub Bump(ByRef x As Long, ByVal y As Long)
    x = x + 1
    y = y + 1
End Sub

Sub Test()
    Dim a As Long, b As Long
    a = 1: b = 1
    Bump a, b
    Debug.Print a, b   ' 2  1
End Sub
