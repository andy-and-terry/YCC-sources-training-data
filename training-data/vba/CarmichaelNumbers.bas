' Carmichael numbers via Korselt's criterion: n is squarefree, composite,
' and p - 1 divides n - 1 for every prime factor p.
Private Function IsCarmichael(ByVal n As Long) As Boolean
    Dim m As Long, p As Long, count As Long
    m = n
    p = 2
    Do While p * p <= m
        If m Mod p = 0 Then
            m = m \ p
            If m Mod p = 0 Then Exit Function
            If (n - 1) Mod (p - 1) <> 0 Then Exit Function
            count = count + 1
        End If
        p = p + 1
    Loop
    If m > 1 Then
        If (n - 1) Mod (m - 1) <> 0 Then Exit Function
        count = count + 1
    End If
    IsCarmichael = (count >= 2)
End Function

Public Sub CarmichaelNumbers()
    Dim n As Long, out As String
    For n = 3 To 2999 Step 2
        If IsCarmichael(n) Then out = out & n & " "
    Next n
    Debug.Print Trim$(out)
End Sub
