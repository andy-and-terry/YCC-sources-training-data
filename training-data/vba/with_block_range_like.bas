Type Cfg: Name As String: Port As Long: End Type
Sub Demo()
    Dim c As Cfg
    With c
        .Name = "api": .Port = 8080
        Debug.Print .Name & ":" & .Port
    End With
End Sub
