Sub StringManipulation()
    Dim s As String
    s = "Hello, VBA World!"
    Debug.Print UCase(s)
    Debug.Print LCase(s)
    Debug.Print Len(s)
    Debug.Print Split(s, " ")(0)
    Debug.Print Replace(s, "World", "Programming")
End Sub

Sub Main()
    StringManipulation
End Sub
