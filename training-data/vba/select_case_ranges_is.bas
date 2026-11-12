Function Grade(s As Integer) As String
    Select Case s
        Case Is >= 90: Grade = "A"
        Case 80 To 89: Grade = "B"
        Case Else: Grade = "C"
    End Select
End Function
