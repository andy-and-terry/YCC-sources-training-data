Function Classify(ByVal n As Long) As String
    Select Case n
        Case Is < 0
            Classify = "negative"
        Case 0
            Classify = "zero"
        Case 1 To 9
            Classify = "single digit"
        Case 10, 20, 30
            Classify = "round ten"
        Case Is >= 100
            Classify = "large"
        Case Else
            Classify = "other"
    End Select
End Function

Function GradeFor(ByVal score As Double) As String
    Select Case True
        Case score >= 90: GradeFor = "A"
        Case score >= 80: GradeFor = "B"
        Case score >= 70: GradeFor = "C"
        Case Else: GradeFor = "F"
    End Select
End Function

Function DayKind(ByVal d As String) As String
    Select Case LCase$(d)
        Case "sat", "sun"
            DayKind = "weekend"
        Case "mon" To "fri"
            DayKind = "weekday"
        Case Else
            DayKind = "unknown"
    End Select
End Function

Sub Main()
    Dim v As Variant
    For Each v In Array(-5, 0, 7, 20, 55, 250)
        Debug.Print v; Classify(CLng(v))
    Next v
    Debug.Print GradeFor(95), GradeFor(82.5), GradeFor(40)
    Debug.Print DayKind("SAT"), DayKind("wed"), DayKind("xyz")
End Sub
