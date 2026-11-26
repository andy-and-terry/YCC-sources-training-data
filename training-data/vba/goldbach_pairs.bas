' Goldbach partitions of 100; expect 6.
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

Public Sub Main()
    Dim c As Long, p As Long, n As Long
    For p = 2 To 50
        If IsPrime(p) And IsPrime(100 - p) Then c = c + 1
    Next p
    Debug.Print c
End Sub
