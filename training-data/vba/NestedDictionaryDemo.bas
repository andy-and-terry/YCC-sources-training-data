Sub GroupByFirstLetter(words() As String, groups As Object)
    Dim i As Long, key As String
    For i = LBound(words) To UBound(words)
        key = UCase(Left(words(i), 1))
        If Not groups.Exists(key) Then
            groups.Add key, New Collection
        End If
        groups(key).Add words(i)
    Next i
End Sub

Sub Main()
    Dim names(4) As String
    names(0) = "Alice": names(1) = "Adam": names(2) = "Bob"
    names(3) = "Beth": names(4) = "Carl"

    Dim groups As Object
    Set groups = CreateObject("Scripting.Dictionary")
    GroupByFirstLetter names, groups

    Dim key As Variant, item As Variant
    For Each key In groups.Keys
        Debug.Print key & ":"
        For Each item In groups(key)
            Debug.Print "  " & item
        Next item
    Next key
End Sub
