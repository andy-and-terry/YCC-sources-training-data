Function Greet(name As String, Optional greeting As String = "Hello") As String
    Greet = greeting & ", " & name & "!"
End Function

Sub Main()
    Debug.Print Greet("World")
    Debug.Print Greet("World", "Hi")
End Sub
