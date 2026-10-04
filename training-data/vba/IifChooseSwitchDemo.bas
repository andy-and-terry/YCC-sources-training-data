Function Grade(ByVal score As Long) As String
    Grade = Switch(score >= 90, "A", score >= 80, "B", score >= 70, "C", True, "F")
End Function

Sub Main()
    Dim v As Variant
    For Each v In Array(95, 82, 67, 40)
        Debug.Print v & " -> " & Grade(CLng(v)) & _
            " (" & IIf(v >= 60, "pass", "fail") & ")"
    Next v

    Dim day As Long
    For day = 1 To 3
        Debug.Print Choose(day, "Mon", "Tue", "Wed")
    Next day
End Sub
