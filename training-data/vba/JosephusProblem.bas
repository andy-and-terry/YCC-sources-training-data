Function JosephusSurvivor(peopleCount As Long, stepSize As Long) As Long
    Dim circle As New Collection
    Dim i As Long, index As Long

    For i = 1 To peopleCount
        circle.Add i
    Next i

    index = 0
    Do While circle.Count > 1
        index = (index + stepSize - 1) Mod circle.Count
        circle.Remove index + 1
    Loop

    JosephusSurvivor = circle(1)
End Function

Sub Main()
    Debug.Print JosephusSurvivor(7, 3)
End Sub
