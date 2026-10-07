Function TrySheetName(index As Long) As String
    On Error Resume Next
    Err.Clear
    TrySheetName = Sheets(index).Name
    If Err.Number <> 0 Then
        TrySheetName = "no sheet at index " & index
        Err.Clear
    End If
    On Error GoTo 0
End Function

Sub Main()
    Debug.Print TrySheetName(1)
    Debug.Print TrySheetName(99)
End Sub
