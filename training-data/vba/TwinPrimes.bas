Function IsPrime(n As Long) As Boolean
    Dim d As Long
    If n < 2 Then Exit Function
    For d = 2 To Int(Sqr(n))
        If n Mod d = 0 Then Exit Function
    Next d
    IsPrime = True
End Function

Sub Demo()
    Dim p As Long
    For p = 3 To 48
        If IsPrime(p) And IsPrime(p + 2) Then Debug.Print "(" & p & ", " & (p + 2) & ")"
    Next p
End Sub
