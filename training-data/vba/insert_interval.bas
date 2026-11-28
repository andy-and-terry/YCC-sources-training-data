Public Sub DemoInsertInterval()
    Dim los As Variant, his As Variant
    los = Array(1, 6): his = Array(3, 9)
    Dim nlo As Long, nhi As Long, i As Long, placed As Boolean, result As String
    nlo = 2: nhi = 5
    For i = 0 To UBound(los)
        If his(i) < nlo Then
            result = result & "[" & los(i) & "," & his(i) & "] "
        ElseIf los(i) > nhi Then
            If Not placed Then result = result & "[" & nlo & "," & nhi & "] ": placed = True
            result = result & "[" & los(i) & "," & his(i) & "] "
        Else
            If los(i) < nlo Then nlo = los(i)
            If his(i) > nhi Then nhi = his(i)
        End If
    Next i
    If Not placed Then result = result & "[" & nlo & "," & nhi & "] "
    Debug.Print result ' [1,5] [6,9]
End Sub
