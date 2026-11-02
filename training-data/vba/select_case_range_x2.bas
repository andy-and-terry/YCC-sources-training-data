Function Grade(score As Long) As String
    Select Case score
        Case 90 To 100: Grade = "A"
        Case 80 To 89:  Grade = "B"
        Case Is < 80:   Grade = "C"
    End Select
End Function
