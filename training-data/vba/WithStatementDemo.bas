Type PointType
    x As Long
    y As Long
End Type

Sub WithStatementDemo()
    Dim p As PointType
    With p
        .x = 5
        .y = 10
    End With
    Debug.Print p.x, p.y
End Sub

Sub Main()
    WithStatementDemo
End Sub
