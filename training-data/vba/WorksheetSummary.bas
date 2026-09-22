Sub WorksheetSummary()
    Dim ws As Worksheet
    For Each ws In ThisWorkbook.Worksheets
        Debug.Print ws.Name, ws.UsedRange.Rows.Count, ws.UsedRange.Columns.Count
    Next ws
End Sub

Sub Main()
    WorksheetSummary
End Sub
