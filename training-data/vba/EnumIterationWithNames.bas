Public Enum Weekday2
    Mon = 1
    Tue
    Wed
    Thu
    Fri
End Enum

Function DayName(ByVal d As Weekday2) As String
    Select Case d
        Case Mon: DayName = "Monday"
        Case Tue: DayName = "Tuesday"
        Case Wed: DayName = "Wednesday"
        Case Thu: DayName = "Thursday"
        Case Fri: DayName = "Friday"
    End Select
End Function

Sub Main()
    Dim d As Weekday2
    For d = Mon To Fri
        Debug.Print d & " = " & DayName(d)
    Next d
End Sub
