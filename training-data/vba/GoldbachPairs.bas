Function IsPrime(n As Long) As Boolean
    Dim d As Long
    If n < 2 Then Exit Function
    For d = 2 To Int(Sqr(n))
        If n Mod d = 0 Then Exit Function
    Next d
    IsPrime = True
End Function

Sub Demo()
    Const N As Long = 28
    Dim p As Long
    For p = 2 To N \ 2
        If IsPrime(p) And IsPrime(N - p) Then Debug.Print p & " + " & (N - p)
    Next p
End Sub
