Function IsSelfDescribing(s As String) As Boolean
    Dim i As Long, j As Long, count As Long
    For i = 0 To Len(s) - 1
        count = 0
        For j = 1 To Len(s)
            If Mid$(s, j, 1) = CStr(i) Then count = count + 1
        Next j
        If count <> CLng(Mid$(s, i + 1, 1)) Then Exit Function
    Next i
    IsSelfDescribing = True
End Function

Sub Main()
    Debug.Print "1210"; IsSelfDescribing("1210")
    Debug.Print "2020"; IsSelfDescribing("2020")
    Debug.Print "21200"; IsSelfDescribing("21200")
    Debug.Print "1211"; IsSelfDescribing("1211")
End Sub
