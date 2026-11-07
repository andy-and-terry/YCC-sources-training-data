Public Function ColumnTitle(ByVal n As Long) As String
    Do While n > 0
        n = n - 1
        ColumnTitle = Chr$(65 + n Mod 26) & ColumnTitle
        n = n \ 26
    Loop
End Function

Public Sub DemoColumnTitle()
    Debug.Print ColumnTitle(28), ColumnTitle(701) ' AB   ZY
End Sub
