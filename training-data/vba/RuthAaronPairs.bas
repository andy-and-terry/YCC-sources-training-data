' Sum of prime factors counted with multiplicity.
Function Sopfr(ByVal n As Long) As Long
    Dim p As Long
    p = 2
    Do While p * p <= n
        Do While n Mod p = 0
            Sopfr = Sopfr + p
            n = n \ p
        Loop
        p = p + 1
    Loop
    If n > 1 Then Sopfr = Sopfr + n
End Function

Sub PrintRuthAaron()
    Dim n As Long, out As String
    For n = 2 To 109
        If Sopfr(n) = Sopfr(n + 1) Then out = out & n & " "
    Next n
    Debug.Print Trim(out)
End Sub
