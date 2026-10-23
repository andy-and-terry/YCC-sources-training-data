Function Grade(ByVal score As Long) As String
    Select Case score
        Case Is >= 90
            Grade = "A"
        Case 80 To 89
            Grade = "B"
        Case 70 To 79, 65
            Grade = "C"
        Case Else
            Grade = "F"
    End Select
End Function

Sub Main()
    Dim s As Variant
    For Each s In Array(95, 85, 72, 65, 10)
        Debug.Print s & " -> " & Grade(CLng(s))
    Next s
End Sub
