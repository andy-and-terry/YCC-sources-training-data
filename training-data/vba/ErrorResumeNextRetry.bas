Function TryDivide(ByVal a As Double, ByVal b As Double, ByRef result As Double) As Boolean
    On Error GoTo Failed
    result = a / b
    TryDivide = True
    Exit Function
Failed:
    Debug.Print "Error " & Err.Number & ": " & Err.Description
    TryDivide = False
End Function

Sub Main()
    Dim r As Double
    If TryDivide(10, 4, r) Then Debug.Print "10/4 = " & r
    If Not TryDivide(1, 0, r) Then Debug.Print "division failed"

    Dim attempts As Long
Retry:
    On Error GoTo Handler
    attempts = attempts + 1
    If attempts < 3 Then Err.Raise 5, , "transient failure"
    Debug.Print "Succeeded after " & attempts & " attempts"
    Exit Sub
Handler:
    Debug.Print "Attempt " & attempts & " failed: " & Err.Description
    Resume Retry
End Sub
