Attribute VB_Name = "PerfectSquareCheck"
Option Explicit

Public Function IsPerfectSquare(ByVal n As Long) As Boolean
    If n < 0 Then Exit Function
    Dim r As Long
    r = CLng(Sqr(n))
    IsPerfectSquare = (r * r = n)
End Function

Public Sub Demo()
    Dim n As Long, out As String
    For n = 0 To 29
        If IsPerfectSquare(n) Then out = out & n & " "
    Next n
    Debug.Print out
End Sub
