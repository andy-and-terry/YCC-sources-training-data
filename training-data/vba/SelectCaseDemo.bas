Function Classify(ByVal score As Long) As String
    Select Case score
        Case Is >= 90
            Classify = "A"
        Case 80 To 89
            Classify = "B"
        Case 70 To 79
            Classify = "C"
        Case 0 To 69
            Classify = "F"
        Case Else
            Classify = "invalid"
    End Select
End Function

Function DayType(ByVal d As Long) As String
    Select Case d
        Case 1, 7
            DayType = "weekend"
        Case 2 To 6
            DayType = "weekday"
        Case Else
            DayType = "unknown"
    End Select
End Function

Sub Main()
    Debug.Print Classify(95), Classify(85), Classify(72), Classify(10), Classify(-5)
    Debug.Print DayType(1), DayType(4), DayType(9)

    Select Case True
        Case 5 > 10
            Debug.Print "never"
        Case 5 > 1
            Debug.Print "Select Case True picks the first match"
    End Select
End Sub
