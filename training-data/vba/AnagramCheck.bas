Function SortString(s As String) As String
    Dim chars() As String
    Dim n As Long
    n = Len(s)
    ReDim chars(n - 1)
    Dim i As Long, j As Long
    For i = 1 To n
        chars(i - 1) = Mid(s, i, 1)
    Next i
    For i = 0 To n - 2
        For j = 0 To n - 2 - i
            If chars(j) > chars(j + 1) Then
                Dim temp As String
                temp = chars(j)
                chars(j) = chars(j + 1)
                chars(j + 1) = temp
            End If
        Next j
    Next i
    Dim result As String
    result = ""
    For i = 0 To n - 1
        result = result & chars(i)
    Next i
    SortString = result
End Function

Function IsAnagram(a As String, b As String) As Boolean
    Dim normA As String, normB As String
    normA = SortString(Replace(LCase(a), " ", ""))
    normB = SortString(Replace(LCase(b), " ", ""))
    IsAnagram = (normA = normB)
End Function

Sub Main()
    Debug.Print IsAnagram("listen", "silent")
    Debug.Print IsAnagram("hello", "world")
End Sub
