Const MAX_RETRIES As Long = 3
Const APP_NAME As String = "Demo"

Enum Permission
    PermNone = 0
    PermRead = 1
    PermWrite = 2
    PermExecute = 4
End Enum

Function Describe(ByVal p As Long) As String
    Dim s As String
    If p And PermRead Then s = s & "r" Else s = s & "-"
    If p And PermWrite Then s = s & "w" Else s = s & "-"
    If p And PermExecute Then s = s & "x" Else s = s & "-"
    Describe = s
End Function

Sub Main()
    Dim p As Long
    p = PermRead Or PermWrite
    Debug.Print APP_NAME & " max retries: " & MAX_RETRIES
    Debug.Print Describe(p)
    p = p Or PermExecute
    Debug.Print Describe(p)
    p = p And Not PermWrite
    Debug.Print Describe(p)
    Debug.Print Describe(PermNone)
End Sub
