#Const DebugMode = True
#Const Version = 2

Function Describe() As String
#If DebugMode Then
    Describe = "debug build"
#Else
    Describe = "release build"
#End If
End Function

Function Greeting() As String
#If Version = 1 Then
    Greeting = "Hello v1"
#ElseIf Version = 2 Then
    Greeting = "Hello v2"
#Else
    Greeting = "Hello unknown"
#End If
End Function

Sub Main()
    Debug.Print Describe()
    Debug.Print Greeting()
#If VBA7 Then
    Debug.Print "running on VBA7 or later"
#Else
    Debug.Print "older VBA"
#End If
End Sub
