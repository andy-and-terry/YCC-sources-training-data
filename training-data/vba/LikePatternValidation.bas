Function IsValidZip(ByVal s As String) As Boolean
    IsValidZip = s Like "#####" Or s Like "#####-####"
End Function

Function IsValidPlate(ByVal s As String) As Boolean
    IsValidPlate = s Like "[A-Z][A-Z][A-Z]-###"
End Function

Function LooksLikeEmail(ByVal s As String) As Boolean
    LooksLikeEmail = s Like "?*@?*.??*"
End Function

Sub Main()
    Debug.Print IsValidZip("90210"), IsValidZip("90210-1234"), IsValidZip("9021")
    Debug.Print IsValidPlate("ABC-123"), IsValidPlate("AB-1234")
    Debug.Print LooksLikeEmail("me@example.com"), LooksLikeEmail("nope")
End Sub
