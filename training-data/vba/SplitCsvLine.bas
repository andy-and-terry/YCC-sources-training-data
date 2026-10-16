Function ParseCsvLine(ByVal line As String) As Collection
    Dim result As New Collection
    Dim i As Long, ch As String, field As String, inQuotes As Boolean
    For i = 1 To Len(line)
        ch = Mid$(line, i, 1)
        If ch = """" Then
            If inQuotes And Mid$(line, i + 1, 1) = """" Then
                field = field & """"
                i = i + 1
            Else
                inQuotes = Not inQuotes
            End If
        ElseIf ch = "," And Not inQuotes Then
            result.Add field
            field = ""
        Else
            field = field & ch
        End If
    Next i
    result.Add field
    Set ParseCsvLine = result
End Function

Sub Main()
    Dim fields As Collection, f As Variant
    Set fields = ParseCsvLine("42,""Smith, John"",""He said """"hi"""""",end")
    For Each f In fields
        Debug.Print "[" & f & "]"
    Next f
End Sub
