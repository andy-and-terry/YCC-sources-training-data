Option Explicit

Sub StringReplaceSplitJoinDemo()
    Dim s As String
    s = "one,two,,three"

    Dim parts() As String
    parts = Split(s, ",")
    Debug.Print "Parts: " & (UBound(parts) + 1)

    Dim i As Long
    For i = LBound(parts) To UBound(parts)
        parts(i) = UCase$(Left$(parts(i), 1)) & Mid$(parts(i), 2)
    Next i

    Debug.Print Join(parts, "-")
    Debug.Print Replace(s, ",,", ",", 1, -1, vbTextCompare)
    Debug.Print StrReverse("stressed")
End Sub
