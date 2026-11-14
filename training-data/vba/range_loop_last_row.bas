Sub SumColumn()
    Dim ws As Worksheet, lastRow As Long, i As Long, t As Double
    Set ws = ActiveSheet
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    For i = 2 To lastRow
        t = t + ws.Cells(i, 1).Value
    Next i
    Debug.Print t
End Sub
