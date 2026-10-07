Function IsValidEmail(text As String) As Boolean
    Dim re As Object
    Set re = CreateObject("VBScript.RegExp")
    re.Pattern = "^\w+@\w+\.\w+$"
    re.IgnoreCase = True
    IsValidEmail = re.Test(text)
End Function

Function ExtractDigits(text As String) As String
    Dim re As Object
    Set re = CreateObject("VBScript.RegExp")
    re.Pattern = "\d+"
    re.Global = True

    Dim matches As Object
    Set matches = re.Execute(text)

    Dim result As String
    Dim m As Object
    For Each m In matches
        If Len(result) > 0 Then result = result & ","
        result = result & m.Value
    Next m

    ExtractDigits = result
End Function

Sub Main()
    Debug.Print IsValidEmail("ada@example.com")
    Debug.Print IsValidEmail("not-an-email")
    Debug.Print ExtractDigits("Room 12, Floor 3, Desk 45")
End Sub
