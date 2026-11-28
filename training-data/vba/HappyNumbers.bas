Function IsHappy(ByVal n As Long) As Boolean
    Dim i As Long, s As Long, m As Long
    For i = 1 To 20
        If n = 1 Then Exit For
        s = 0
        m = n
        Do While m > 0
            s = s + (m Mod 10) * (m Mod 10)
            m = m \ 10
        Loop
        n = s
    Next i
    IsHappy = (n = 1)
End Function

Sub ShowHappy()
    Dim n As Long, count As Long, out As String
    n = 1
    Do While count < 8
        If IsHappy(n) Then
            out = out & n & " "
            count = count + 1
        End If
        n = n + 1
    Loop
    Debug.Print out ' 1 7 10 13 19 23 28 31
End Sub
