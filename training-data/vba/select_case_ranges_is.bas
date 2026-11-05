Function Grade(score As Integer) As String
    Select Case score
        Case Is >= 90: Grade = "A"
        Case 80 To 89: Grade = "B"
        Case 70 To 79: Grade = "C"
        Case Else: Grade = "F"
    End Select
End Function

Sub Test()
    Debug.Print Grade(95), Grade(83), Grade(40)
End Sub
