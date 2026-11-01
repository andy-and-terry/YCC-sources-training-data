Sub SumColumn()
    Dim ws As Worksheet: Set ws = ActiveSheet
    Dim lastRow As Long, r As Long, total As Double
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    For r = 2 To lastRow
        If IsNumeric(ws.Cells(r, "A").Value) Then total = total + ws.Cells(r, "A").Value
    Next r
    ws.Range("C1").Value = total
End Sub
