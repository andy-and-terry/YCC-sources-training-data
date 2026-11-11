' Square of the sum minus sum of squares for 1..10 (expect 2640)
Sub Main()
    Dim i As Long, total As Long, squares As Long
    For i = 1 To 10
        total = total + i
        squares = squares + i * i
    Next i
    Debug.Print total * total - squares
End Sub
