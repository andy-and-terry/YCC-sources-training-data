Function Classify(n As Variant) As String
    Select Case True
        Case IsNull(n): Classify = "null"
        Case Not IsNumeric(n): Classify = "text"
        Case n < 0: Classify = "negative"
        Case n = 0: Classify = "zero"
        Case n <= 9: Classify = "digit"
        Case Else: Classify = "large"
    End Select
End Function

Sub ControlFlowDemo()
    Dim v As Variant
    For Each v In Array(-5, 0, 7, 100, "abc")
        Debug.Print v, Classify(v)
    Next v
    Dim i As Integer
    Do While i < 10
        i = i + 3
        If i = 6 Then GoTo Skip
        Debug.Print "i=" & i
Skip:
    Loop
    Do
        i = i - 4
    Loop Until i < 0
    Debug.Print i
    For i = 10 To 1 Step -4: Debug.Print i;: Next i
    Debug.Print
    Select Case 5
        Case 1 To 3: Debug.Print "low"
        Case 4, 5, 6: Debug.Print "mid"
        Case Is > 6: Debug.Print "high"
    End Select
    With Application.WorksheetFunction
        Debug.Print .Max(1, 9, 4)
    End With
End Sub
