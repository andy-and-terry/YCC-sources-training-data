Sub Bump(ByRef a As Long, ByVal b As Long)
    a = a + 1: b = b + 1
End Sub

Sub Demo()
    Dim x As Long, y As Long
    x = 1: y = 1
    Bump x, y
    Debug.Print x, y   ' 2 1
End Sub
