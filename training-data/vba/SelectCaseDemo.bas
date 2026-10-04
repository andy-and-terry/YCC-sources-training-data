Function Classify(ByVal n As Long) As String
    Select Case n
        Case Is < 0
            Classify = "negative"
        Case 0
            Classify = "zero"
        Case 1 To 9
            Classify = "single digit"
        Case 10, 20, 30
            Classify = "round number"
        Case Else
            Classify = "large"
    End Select
End Function

Sub Main()
    Dim v As Variant
    For Each v In Array(-4, 0, 7, 20, 99)
        Debug.Print v & " -> " & Classify(CLng(v))
    Next v
End Sub
