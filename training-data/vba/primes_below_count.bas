Attribute VB_Name = "PrimesBelowCount"
Option Explicit

Public Function CountPrimesBelow(ByVal n As Long) As Long
    If n < 3 Then Exit Function
    Dim composite() As Boolean
    ReDim composite(0 To n - 1)
    Dim i As Long, j As Long, count As Long
    For i = 2 To n - 1
        If Not composite(i) Then
            count = count + 1
            For j = i * i To n - 1 Step i
                composite(j) = True
            Next j
        End If
    Next i
    CountPrimesBelow = count
End Function
