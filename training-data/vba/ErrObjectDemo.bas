Function Describe(ByVal action As Integer) As String
    On Error GoTo Handler
    Dim arr(1 To 3) As Integer
    Dim x As Integer

    Select Case action
        Case 1: x = 1 \ 0
        Case 2: arr(5) = 1
        Case 3: x = CInt("abc")
        Case 4: Err.Raise vbObjectError + 1001, "Describe", "custom failure"
    End Select
    Describe = "no error"
    Exit Function

Handler:
    Describe = "#" & Err.Number & " from " & Err.Source & ": " & Err.Description
    Err.Clear
End Function

Sub Main()
    Dim i As Integer
    For i = 0 To 4
        Debug.Print i, Describe(i)
    Next i
End Sub
