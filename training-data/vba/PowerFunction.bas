Function MyPower(base As Long, exp As Long) As Long
    Dim half As Long
    If exp = 0 Then
        MyPower = 1
    ElseIf exp Mod 2 = 0 Then
        half = MyPower(base, exp \ 2)
        MyPower = half * half
    Else
        MyPower = base * MyPower(base, exp - 1)
    End If
End Function

Sub Main()
    Debug.Print MyPower(2, 10)
    Debug.Print MyPower(3, 5)
End Sub
