' Aliquot sequence: replace n by the sum of its proper divisors.
Private Function AliquotSum(ByVal n As Long) As Long
    Dim d As Long, s As Long
    For d = 1 To n \ 2
        If n Mod d = 0 Then s = s + d
    Next d
    AliquotSum = s
End Function

Public Sub Main()
    Dim n As Long, count As Long, out As String
    n = 12
    out = n & " "
    Do While n > 1 And count < 19
        n = AliquotSum(n)
        out = out & n & " "
        count = count + 1
    Loop
    Debug.Print out
End Sub
