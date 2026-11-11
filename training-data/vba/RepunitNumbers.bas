' Repunits: numbers made only of the digit 1.
Public Sub PrintRepunits()
    Dim r As Double, i As Long, out As String
    For i = 1 To 5
        r = r * 10 + 1
        out = out & r & " "
    Next i
    Debug.Print Trim$(out)
End Sub
