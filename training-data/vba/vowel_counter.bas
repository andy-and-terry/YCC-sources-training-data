Attribute VB_Name = "VowelCounter"
Option Explicit

Public Function CountVowels(ByVal s As String) As Long
    Dim i As Long
    s = LCase$(s)
    For i = 1 To Len(s)
        If InStr("aeiou", Mid$(s, i, 1)) > 0 Then CountVowels = CountVowels + 1
    Next i
End Function

Public Sub Demo()
    Debug.Print CountVowels("Education is beautiful")
End Sub
