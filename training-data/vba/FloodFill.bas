Sub FloodFill(img() As Long, ByVal r As Long, ByVal c As Long, ByVal oldColor As Long, ByVal newColor As Long)
    If r < LBound(img, 1) Or r > UBound(img, 1) Then Exit Sub
    If c < LBound(img, 2) Or c > UBound(img, 2) Then Exit Sub
    If img(r, c) <> oldColor Then Exit Sub

    img(r, c) = newColor
    FloodFill img, r + 1, c, oldColor, newColor
    FloodFill img, r - 1, c, oldColor, newColor
    FloodFill img, r, c + 1, oldColor, newColor
    FloodFill img, r, c - 1, oldColor, newColor
End Sub

Sub Main()
    Dim img(0 To 2, 0 To 2) As Long
    Dim r As Long, c As Long, line As String
    img(0, 0) = 1: img(0, 1) = 1: img(0, 2) = 0
    img(1, 0) = 1: img(1, 1) = 0: img(1, 2) = 0
    img(2, 0) = 1: img(2, 1) = 1: img(2, 2) = 1

    FloodFill img, 0, 0, img(0, 0), 7

    For r = 0 To 2
        line = ""
        For c = 0 To 2
            line = line & img(r, c) & " "
        Next c
        Debug.Print Trim(line)
    Next r
End Sub
