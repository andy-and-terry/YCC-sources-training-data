' Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
Private Function Gcd(ByVal a As Long, ByVal b As Long) As Long
    Dim t As Long
    Do While b <> 0
        t = a Mod b
        a = b
        b = t
    Loop
    Gcd = a
End Function

Private Function Phi(ByVal n As Long) As Long
    Dim k As Long, c As Long
    For k = 1 To n
        If Gcd(k, n) = 1 Then c = c + 1
    Next k
    Phi = c
End Function

Public Sub PerfectTotientNumbers()
    Dim n As Long, m As Long, total As Long, out As String
    For n = 2 To 199
        total = 0
        m = n
        Do While m > 1
            m = Phi(m)
            total = total + m
        Loop
        If total = n Then out = out & n & " "
    Next n
    Debug.Print Trim$(out)
End Sub
