' Squarefree numbers up to 100; expect 61.
Option Explicit

Private Function Squarefree(ByVal n As Long) As Boolean
    Dim d As Long
    Squarefree = True
    d = 2
    Do While d * d <= n
        If n Mod (d * d) = 0 Then Squarefree = False
        d = d + 1
    Loop
End Function

Public Sub Main()
    Dim c As Long, p As Long, n As Long
    For n = 1 To 100
        If Squarefree(n) Then c = c + 1
    Next n
    Debug.Print c
End Sub
