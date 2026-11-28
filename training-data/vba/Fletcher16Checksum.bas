Public Function Fletcher16(ByVal s As String) As Long
    Dim s1 As Long, s2 As Long, i As Long
    For i = 1 To Len(s)
        s1 = (s1 + Asc(Mid$(s, i, 1))) Mod 255
        s2 = (s2 + s1) Mod 255
    Next i
    Fletcher16 = s2 * 256& + s1
End Function

Public Sub Main()
    Debug.Print Hex$(Fletcher16("abcde")) ' C8F0
End Sub
