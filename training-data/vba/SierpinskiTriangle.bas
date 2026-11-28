Attribute VB_Name = "SierpinskiTriangle"
Sub Main()
    Dim n As Long, r As Long, c As Long, line As String
    n = 8
    For r = 0 To n - 1
        line = Space$(n - r - 1)
        For c = 0 To r
            line = line & IIf((r And c) = c, "* ", "  ")
        Next c
        Debug.Print line
    Next r
End Sub
