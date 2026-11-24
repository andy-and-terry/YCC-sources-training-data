' Moebius function: 0 if n has a squared prime factor, else (-1)^k.
Private Function Mobius(ByVal n As Long) As Long
    Dim result As Long, p As Long
    result = 1
    p = 2
    Do While p * p <= n
        If n Mod p = 0 Then
            n = n \ p
            If n Mod p = 0 Then
                Mobius = 0
                Exit Function
            End If
            result = -result
        End If
        p = p + 1
    Loop
    If n > 1 Then result = -result
    Mobius = result
End Function

Public Sub Main()
    Dim n As Long, out As String
    For n = 1 To 30
        out = out & Mobius(n) & " "
    Next n
    Debug.Print out
End Sub
