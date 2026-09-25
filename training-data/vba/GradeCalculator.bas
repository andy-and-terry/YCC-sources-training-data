Function LetterGrade(score As Long) As String
    Select Case score
        Case Is >= 90
            LetterGrade = "A"
        Case 80 To 89
            LetterGrade = "B"
        Case 70 To 79
            LetterGrade = "C"
        Case 60 To 69
            LetterGrade = "D"
        Case Else
            LetterGrade = "F"
    End Select
End Function

Sub Main()
    Debug.Print LetterGrade(95)
    Debug.Print LetterGrade(82)
    Debug.Print LetterGrade(55)
End Sub
