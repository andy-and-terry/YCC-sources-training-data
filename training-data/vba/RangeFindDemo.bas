Function FindValueAddress(target As Range, searchFor As Variant) As String
    Dim found As Range
    Set found = target.Find(What:=searchFor, LookAt:=xlWhole)

    If found Is Nothing Then
        FindValueAddress = "not found"
    Else
        FindValueAddress = found.Address
    End If
End Function

Sub Main()
    Debug.Print FindValueAddress(Range("A1:A20"), "Total")
End Sub
