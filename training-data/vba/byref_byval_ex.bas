Sub Increment(ByRef x As Long, ByVal step As Long)
    x = x + step
    step = 0
End Sub

Sub Test()
    Dim n As Long: n = 5
    Dim s As Long: s = 2
    Increment n, s
    Debug.Print n, s
End Sub
