Attribute VB_Name = "UglyNumbers"
Option Explicit

Public Function Ugly(ByVal n As Long) As Double
    Dim seq() As Double, i2 As Long, i3 As Long, i5 As Long
    Dim c2 As Double, c3 As Double, c5 As Double, nxt As Double, k As Long
    ReDim seq(1 To n)
    seq(1) = 1: i2 = 1: i3 = 1: i5 = 1
    For k = 2 To n
        c2 = seq(i2) * 2: c3 = seq(i3) * 3: c5 = seq(i5) * 5
        nxt = c2
        If c3 < nxt Then nxt = c3
        If c5 < nxt Then nxt = c5
        seq(k) = nxt
        If nxt = c2 Then i2 = i2 + 1
        If nxt = c3 Then i3 = i3 + 1
        If nxt = c5 Then i5 = i5 + 1
    Next k
    Ugly = seq(n)
End Function

Public Sub DemoUgly()
    Dim i As Long, s As String
    For i = 1 To 12: s = s & Ugly(i) & " ": Next i
    Debug.Print s
End Sub
