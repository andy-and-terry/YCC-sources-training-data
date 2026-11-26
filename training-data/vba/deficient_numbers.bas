' Deficient numbers below 100; expect 76.
Option Explicit

Private Function ProperSum(ByVal n As Long) As Long
    Dim d As Long
    For d = 1 To n - 1
        If n Mod d = 0 Then ProperSum = ProperSum + d
    Next d
End Function

Public Sub Main()
    Dim c As Long, p As Long, n As Long
    For n = 1 To 99
        If ProperSum(n) < n Then c = c + 1
    Next n
    Debug.Print c
End Sub
