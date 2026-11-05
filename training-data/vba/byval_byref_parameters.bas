Sub AddOneByVal(ByVal x As Long)
    x = x + 1
End Sub

Sub AddOneByRef(ByRef x As Long)
    x = x + 1
End Sub

Sub Test()
    Dim n As Long: n = 5
    AddOneByVal n
    Debug.Print n
    AddOneByRef n
    Debug.Print n
End Sub
