Sub RangeCellsFill()
    Dim r As Long
    For r = 1 To 5
        Cells(r, 1).Value = r
        Cells(r, 2).Formula = "=A" & r & "^2"
    Next r
End Sub
