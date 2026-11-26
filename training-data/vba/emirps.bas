' Emirps below 200; expect 15.
Option Explicit

Private Function IsPrime(ByVal n As Long) As Boolean
    Dim d As Long
    If n < 2 Then Exit Function
    IsPrime = True
    d = 2
    Do While d * d <= n
        If n Mod d = 0 Then IsPrime = False: Exit Function
        d = d + 1
    Loop
End Function

Private Function Rev(ByVal n As Long) As Long
    Do While n > 0
        Rev = Rev * 10 + n Mod 10
        n = n \ 10
    Loop
End Function

Public Sub Main()
    Dim c As Long, p As Long, n As Long
    For n = 2 To 199
        If Rev(n) <> n Then
            If IsPrime(n) And IsPrime(Rev(n)) Then c = c + 1
        End If
    Next n
    Debug.Print c
End Sub
