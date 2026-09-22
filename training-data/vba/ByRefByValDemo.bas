Sub IncrementByRef(ByRef n As Long)
    n = n + 1
End Sub

Sub IncrementByVal(ByVal n As Long)
    n = n + 1
End Sub

Sub Main()
    Dim a As Long, b As Long
    a = 10
    b = 10

    IncrementByRef a
    IncrementByVal b

    Debug.Print "ByRef result: " & a  ' 11, caller's variable changed
    Debug.Print "ByVal result: " & b  ' 10, caller's variable unchanged

    ' ByRef is the default when no keyword is specified
    Dim c As Long
    c = 5
    IncrementDefault c
    Debug.Print "default (ByRef) result: " & c
End Sub

Sub IncrementDefault(n As Long)
    n = n + 1
End Sub
