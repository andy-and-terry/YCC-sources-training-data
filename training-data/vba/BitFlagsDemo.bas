Const FLAG_READ As Long = 1
Const FLAG_WRITE As Long = 2
Const FLAG_EXEC As Long = 4

Function Describe(ByVal perms As Long) As String
    Dim s As String
    If perms And FLAG_READ Then s = s & "r" Else s = s & "-"
    If perms And FLAG_WRITE Then s = s & "w" Else s = s & "-"
    If perms And FLAG_EXEC Then s = s & "x" Else s = s & "-"
    Describe = s
End Function

Sub Main()
    Dim p As Long
    p = FLAG_READ Or FLAG_WRITE
    Debug.Print Describe(p)

    p = p Or FLAG_EXEC
    Debug.Print Describe(p)

    p = p And Not FLAG_WRITE
    Debug.Print Describe(p)

    p = p Xor FLAG_READ
    Debug.Print Describe(p)
End Sub
