Const FLAG_READ As Long = 1
Const FLAG_WRITE As Long = 2
Const FLAG_EXEC As Long = 4

Function Describe(ByVal perms As Long) As String
    Dim result As String
    If perms And FLAG_READ Then result = result & "r" Else result = result & "-"
    If perms And FLAG_WRITE Then result = result & "w" Else result = result & "-"
    If perms And FLAG_EXEC Then result = result & "x" Else result = result & "-"
    Describe = result
End Function

Sub Main()
    Dim perms As Long
    perms = FLAG_READ Or FLAG_WRITE
    Debug.Print Describe(perms)

    perms = perms Or FLAG_EXEC
    Debug.Print Describe(perms)

    perms = perms And Not FLAG_WRITE
    Debug.Print Describe(perms)

    perms = perms Xor FLAG_READ
    Debug.Print Describe(perms)

    Debug.Print 5 And 3; 5 Or 3; 5 Xor 3; Not 5
    Debug.Print 1 * 2 ^ 4
End Sub
