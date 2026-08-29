Function SumRange(startVal As Long, endVal As Long) As Long
    Dim total As Long, i As Long
    total = 0
    For i = startVal To endVal
        total = total + i
    Next i
    SumRange = total
End Function

Sub Main()
    Debug.Print SumRange(1, 100)
End Sub
