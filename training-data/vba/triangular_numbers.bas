Attribute VB_Name = "TriangularNumbers"
Option Explicit

Public Sub Demo()
    Dim n As Long, total As Long, out As String
    For n = 1 To 10
        total = total + n
        out = out & total & " "
    Next n
    Debug.Print out
End Sub
