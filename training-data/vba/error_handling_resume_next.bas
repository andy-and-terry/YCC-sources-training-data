Function SafeDivide(a As Double, b As Double) As Variant
    On Error GoTo Handler
    SafeDivide = a / b
    Exit Function
Handler:
    SafeDivide = "Error " & Err.Number & ": " & Err.Description
    Err.Clear
End Function

Sub ErrorHandlingDemo()
    Debug.Print SafeDivide(10, 2)
    Debug.Print SafeDivide(1, 0)
    On Error Resume Next
    Dim x As Integer
    x = CInt("not a number")
    If Err.Number <> 0 Then Debug.Print "conversion failed: " & Err.Number: Err.Clear
    On Error GoTo 0
    On Error GoTo Cleanup
    Err.Raise vbObjectError + 1000, "Demo", "custom failure"
    Debug.Print "not reached"
Cleanup:
    Debug.Print "caught: " & Err.Description & " (" & Err.Source & ")"
End Sub
