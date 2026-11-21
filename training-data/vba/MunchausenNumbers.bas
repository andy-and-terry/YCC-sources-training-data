' Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
Private Function IsMunchausen(ByVal n As Long) As Boolean
    Dim m As Long, d As Long, total As Long
    m = n
    Do While m > 0
        d = m Mod 10
        If d > 0 Then total = total + d ^ d
        m = m \ 10
    Loop
    IsMunchausen = (total = n)
End Function

Public Sub MunchausenNumbers()
    Dim n As Long, out As String
    For n = 1 To 4999
        If IsMunchausen(n) Then out = out & n & " "
    Next n
    Debug.Print Trim$(out)
End Sub
