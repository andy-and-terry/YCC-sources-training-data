Function CountOccurrences(ByVal text As String, ByVal target As String) As Long
    Dim pos As Long, n As Long
    pos = InStr(1, text, target, vbBinaryCompare)
    Do While pos > 0
        n = n + 1
        pos = InStr(pos + Len(target), text, target, vbBinaryCompare)
    Loop
    CountOccurrences = n
End Function

Function FileExtension(ByVal path As String) As String
    Dim dot As Long
    dot = InStrRev(path, ".")
    If dot = 0 Then
        FileExtension = ""
    Else
        FileExtension = Mid$(path, dot + 1)
    End If
End Function

Sub Main()
    Dim s As String
    s = "The quick brown fox jumps over the lazy dog"

    Debug.Print InStr(s, "quick")
    Debug.Print InStr(s, "QUICK")
    Debug.Print InStr(1, s, "QUICK", vbTextCompare)
    Debug.Print InStr(10, s, "o")
    Debug.Print InStrRev(s, "o")
    Debug.Print InStrRev(s, "o", 20)
    Debug.Print InStr(s, "cat")

    Debug.Print CountOccurrences("banana", "an")
    Debug.Print CountOccurrences("aaaa", "aa")
    Debug.Print FileExtension("C:\docs\report.final.xlsx")
    Debug.Print "[" & FileExtension("README") & "]"

    Debug.Print Left$(s, 3), Right$(s, 3), Mid$(s, 5, 5)
    Debug.Print StrReverse("stressed")
    Debug.Print Replace(s, "the", "a", , , vbTextCompare)
    Debug.Print Replace("a-b-c-d", "-", "+", 1, 2)
    Debug.Print UCase$(Left$(s, 1)) & LCase$(Mid$(s, 2, 8))
    Debug.Print StrComp("a", "A", vbTextCompare), StrComp("a", "b")
End Sub
