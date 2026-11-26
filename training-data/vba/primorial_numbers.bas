' Primorials up to 1e6, including 1; expect 8.
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
    Dim acc As Double
    acc = 1: c = 1: p = 2
    Do
        If IsPrime(p) Then
            acc = acc * p
            If acc > 1000000 Then Exit Do
            c = c + 1
        End If
        p = p + 1
    Loop
    Debug.Print c
End Sub
