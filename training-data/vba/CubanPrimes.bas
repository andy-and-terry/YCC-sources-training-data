Private Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then Exit Function
    IsPrime = True
    For i = 2 To Int(Sqr(n))
        If n Mod i = 0 Then IsPrime = False: Exit Function
    Next i
End Function

Public Sub Main()
    Dim y As Long, p As Long, found As Long, out As String
    y = 1
    Do While found < 8
        p = 3 * y * y + 3 * y + 1
        If IsPrime(p) Then out = out & p & " ": found = found + 1
        y = y + 1
    Loop
    Debug.Print out
End Sub
