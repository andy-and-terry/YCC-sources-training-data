Option Explicit

Private Sub LogError(ByVal proc As String)
    Debug.Print "[" & Format$(Now, "hh:nn:ss") & "] " & proc & _
                " failed: #" & Err.Number & " " & Err.Description
End Sub

Public Sub RunErrorLoggingDemo()
    Dim values As Variant
    Dim v As Variant
    values = Array(4, 0, "x", 2)

    For Each v In values
        On Error GoTo Handler
        Debug.Print "100 / " & v & " = " & 100 / v
Continue:
        On Error GoTo 0
    Next v
    Exit Sub

Handler:
    LogError "RunErrorLoggingDemo"
    Resume Continue
End Sub
