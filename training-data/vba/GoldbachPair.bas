' Goldbach pair.
Private Function IsPrime(n As Long) As Boolean
    Dim d As Long
    If n < 2 Then Exit Function
    IsPrime = True
    For d = 2 To Int(Sqr(n))
        If n Mod d = 0 Then IsPrime = False: Exit Function
    Next d
End Function

Public Function Goldbach(n As Long) As String
    Dim p As Long
    For p = 2 To n \ 2
        If IsPrime(p) And IsPrime(n - p) Then Goldbach = p & " + " & (n - p): Exit Function
    Next p
End Function
