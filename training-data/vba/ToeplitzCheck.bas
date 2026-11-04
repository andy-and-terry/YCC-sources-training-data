Attribute VB_Name = "ToeplitzCheck"
Option Explicit

Public Function IsToeplitz(m() As Long) As Boolean
    Dim i As Long, j As Long
    For i = LBound(m, 1) + 1 To UBound(m, 1)
        For j = LBound(m, 2) + 1 To UBound(m, 2)
            If m(i, j) <> m(i - 1, j - 1) Then IsToeplitz = False: Exit Function
        Next j
    Next i
    IsToeplitz = True
End Function

Public Sub DemoToeplitz()
    Dim a(1 To 3, 1 To 3) As Long
    a(1, 1) = 1: a(1, 2) = 2: a(1, 3) = 3
    a(2, 1) = 4: a(2, 2) = 1: a(2, 3) = 2
    a(3, 1) = 5: a(3, 2) = 4: a(3, 3) = 1
    Debug.Print IsToeplitz(a)
End Sub
