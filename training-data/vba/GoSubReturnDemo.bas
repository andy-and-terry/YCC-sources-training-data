Sub Main()
    Dim total As Long
    Dim i As Long

    For i = 1 To 3
        total = total + i
        GoSub ReportProgress
    Next i

    Debug.Print "Final total: " & total
    Exit Sub

ReportProgress:
    Debug.Print "i=" & i & " total=" & total
    Return
End Sub
