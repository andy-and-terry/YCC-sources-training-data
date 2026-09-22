Const ERR_NEGATIVE_INPUT As Long = vbObjectError + 100
Const ERR_TOO_LARGE As Long = vbObjectError + 101

Function ValidatePercentage(ByVal value As Double) As Double
    If value < 0 Then
        Err.Raise ERR_NEGATIVE_INPUT, "ValidatePercentage", "value cannot be negative"
    ElseIf value > 100 Then
        Err.Raise ERR_TOO_LARGE, "ValidatePercentage", "value cannot exceed 100"
    End If
    ValidatePercentage = value
End Function

Sub RunValidation(ByVal value As Double)
    On Error GoTo ErrorHandler
    Debug.Print "valid: " & ValidatePercentage(value)
    Exit Sub

ErrorHandler:
    Select Case Err.Number
        Case ERR_NEGATIVE_INPUT
            Debug.Print "rejected (negative): " & Err.Description
        Case ERR_TOO_LARGE
            Debug.Print "rejected (too large): " & Err.Description
        Case Else
            Debug.Print "unexpected error: " & Err.Description
    End Select
End Sub

Sub Main()
    RunValidation 50
    RunValidation -5
    RunValidation 150

    On Error Resume Next
    Dim result As Double
    result = ValidatePercentage(-1)
    If Err.Number <> 0 Then
        Debug.Print "swallowed error " & Err.Number & ": " & Err.Description
        Err.Clear
    End If
    On Error GoTo 0
End Sub
