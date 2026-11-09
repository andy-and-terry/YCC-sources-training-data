Sub SumColumn()
    Dim ws As Worksheet, r As Long, total As Double
    Set ws = ThisWorkbook.Worksheets("Sheet1")
    For r = 2 To ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
        total = total + ws.Cells(r, 1).Value
    Next r
    ws.Range("C1").Value = total
End Sub
