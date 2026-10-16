Sub Main()
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Worksheets(1)

    ' Read a block in one shot instead of cell by cell.
    Dim vals As Variant
    vals = ws.Range("A1:C10").Value

    Dim r As Long, total As Double
    For r = LBound(vals, 1) To UBound(vals, 1)
        If IsNumeric(vals(r, 3)) Then total = total + vals(r, 3)
    Next r
    Debug.Print "Column C total: " & total

    ' Write results back in one assignment.
    Dim outArr() As Variant
    ReDim outArr(1 To UBound(vals, 1), 1 To 1)
    For r = 1 To UBound(vals, 1)
        outArr(r, 1) = vals(r, 1) & "-" & vals(r, 2)
    Next r
    ws.Range("E1").Resize(UBound(outArr, 1), 1).Value = outArr
End Sub
