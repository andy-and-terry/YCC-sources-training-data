' Pernicious numbers: the popcount is prime.
Function IsPrime(n As Long) As Boolean
    Dim d As Long
    If n < 2 Then Exit Function
    IsPrime = True
    For d = 2 To n - 1
        If d * d > n Then Exit For
        If n Mod d = 0 Then IsPrime = False: Exit Function
    Next d
End Function

Function PopCount(ByVal n As Long) As Long
    Do While n > 0
        PopCount = PopCount + (n And 1)
        n = n \ 2
    Loop
End Function

Sub PrintPernicious()
    Dim n As Long, out As String
    For n = 1 To 20
        If IsPrime(PopCount(n)) Then out = out & n & " "
    Next n
    Debug.Print Trim(out)
End Sub
