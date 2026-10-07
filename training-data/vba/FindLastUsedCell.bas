Function LastUsedRow(ws As Worksheet, col As String) As Long
    LastUsedRow = ws.Range(col & ws.Rows.Count).End(xlUp).Row
End Function

Function SumUsedColumn(ws As Worksheet, col As String) As Double
    Dim lastRow As Long
    lastRow = LastUsedRow(ws, col)
    SumUsedColumn = Application.WorksheetFunction.Sum(ws.Range(col & "1:" & col & lastRow))
End Function

Sub Main()
    Dim total As Double
    total = SumUsedColumn(ActiveSheet, "A")
    Debug.Print total
End Sub
