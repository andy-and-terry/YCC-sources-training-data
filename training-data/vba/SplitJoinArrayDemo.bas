Function CountWords(ByVal text As String) As Long
    Dim parts() As String
    Dim i As Long, n As Long
    parts = Split(Trim$(text), " ")
    For i = LBound(parts) To UBound(parts)
        If Len(parts(i)) > 0 Then n = n + 1
    Next i
    CountWords = n
End Function

Function ReverseWords(ByVal text As String) As String
    Dim parts() As String
    Dim i As Long
    Dim result() As String
    parts = Split(text, " ")
    ReDim result(UBound(parts))
    For i = 0 To UBound(parts)
        result(UBound(parts) - i) = parts(i)
    Next i
    ReverseWords = Join(result, " ")
End Function

Sub Main()
    Dim csv As String
    csv = "red,green,blue,yellow"
    Dim colors() As String
    colors = Split(csv, ",")
    Debug.Print "Count:", UBound(colors) - LBound(colors) + 1
    Debug.Print "Second:", colors(1)
    Debug.Print "Joined:", Join(colors, " | ")

    Dim limited() As String
    limited = Split("a:b:c:d", ":", 2)
    Debug.Print limited(0), limited(1)

    Debug.Print "Words:", CountWords("  the quick  brown fox ")
    Debug.Print ReverseWords("one two three")

    Dim nums As Variant
    nums = Array(3, 1, 4, 1, 5)
    Debug.Print "Array bounds:", LBound(nums), UBound(nums)
    Debug.Print "Filter:", Join(Filter(colors, "e"), ",")
    Debug.Print "Empty split:", UBound(Split("", ","))
End Sub
