Function SpiralOrder(m() As Long) As String
    Dim top As Long, bottom As Long, left As Long, right As Long
    Dim r As Long, c As Long
    Dim result As String

    top = LBound(m, 1): bottom = UBound(m, 1)
    left = LBound(m, 2): right = UBound(m, 2)

    Do While top <= bottom And left <= right
        For c = left To right: result = result & m(top, c) & " ": Next c
        top = top + 1
        For r = top To bottom: result = result & m(r, right) & " ": Next r
        right = right - 1
        If top <= bottom Then
            For c = right To left Step -1: result = result & m(bottom, c) & " ": Next c
            bottom = bottom - 1
        End If
        If left <= right Then
            For r = bottom To top Step -1: result = result & m(r, left) & " ": Next r
            left = left + 1
        End If
    Loop
    SpiralOrder = Trim(result)
End Function

Sub Main()
    Dim grid(0 To 2, 0 To 2) As Long
    Dim r As Long, c As Long, v As Long
    For r = 0 To 2
        For c = 0 To 2
            v = v + 1
            grid(r, c) = v
        Next c
    Next r
    Debug.Print SpiralOrder(grid)
End Sub
