Function Crc8(s As String) As Long
    Dim crc As Long, i As Long, k As Long
    For i = 1 To Len(s)
        crc = crc Xor Asc(Mid$(s, i, 1))
        For k = 1 To 8
            If (crc And &H80) <> 0 Then
                crc = ((crc * 2) Xor &H7) And &HFF
            Else
                crc = (crc * 2) And &HFF
            End If
        Next k
    Next i
    Crc8 = crc
End Function
