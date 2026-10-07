Sub Hanoi(disks As Long, source As String, target As String, auxiliary As String)
    If disks = 1 Then
        Debug.Print "Move disk 1 from " & source & " to " & target
        Exit Sub
    End If
    Hanoi disks - 1, source, auxiliary, target
    Debug.Print "Move disk " & disks & " from " & source & " to " & target
    Hanoi disks - 1, auxiliary, target, source
End Sub

Sub Main()
    Hanoi 3, "A", "C", "B"
End Sub
