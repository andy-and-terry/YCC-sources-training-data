Public Sub DemoTriangleMinPath()
    Dim t(0 To 3, 0 To 3) As Long, dp(0 To 3) As Long
    Dim r As Long, i As Long, m As Long
    t(0, 0) = 2
    t(1, 0) = 3: t(1, 1) = 4
    t(2, 0) = 6: t(2, 1) = 5: t(2, 2) = 7
    t(3, 0) = 4: t(3, 1) = 1: t(3, 2) = 8: t(3, 3) = 3
    For i = 0 To 3: dp(i) = t(3, i): Next i
    For r = 2 To 0 Step -1
        For i = 0 To r
            If dp(i) < dp(i + 1) Then m = dp(i) Else m = dp(i + 1)
            dp(i) = t(r, i) + m
        Next i
    Next r
    Debug.Print dp(0) ' 11
End Sub
