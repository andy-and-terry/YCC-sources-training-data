Sub FastRun(ByVal doWork As Boolean)
    With Application
        .ScreenUpdating = Not doWork
        .EnableEvents = Not doWork
        .Calculation = IIf(doWork, xlCalculationManual, xlCalculationAutomatic)
        .StatusBar = IIf(doWork, "Working...", False)
    End With
End Sub

Sub ProcessSheet()
    On Error GoTo Cleanup
    FastRun True
    Dim r As Long
    For r = 1 To 1000
        Cells(r, 1).Value = r * 2
    Next r
Cleanup:
    FastRun False
    If Err.Number <> 0 Then MsgBox "Failed: " & Err.Description
End Sub
