Sub Main()
    Dim s As String
    s = "Hello, World"
    Mid$(s, 1, 5) = "HOWDY"
    Debug.Print s
    Mid$(s, 8) = "Earth"
    Debug.Print s

    Dim masked As String
    masked = "4111111111111111"
    Mid$(masked, 1, 12) = String$(12, "*")
    Debug.Print masked

    Debug.Print StrReverse("stressed")
    Debug.Print Replace("a-b-c-d", "-", "", , 2)
End Sub
