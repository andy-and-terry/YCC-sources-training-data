Function NextCounterValue() As Long
    Static counter As Long
    counter = counter + 1
    NextCounterValue = counter
End Function

Sub Main()
    Dim i As Long
    For i = 1 To 5
        Debug.Print NextCounterValue()
    Next i
End Sub
