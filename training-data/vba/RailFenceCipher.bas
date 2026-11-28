Function RailFenceEncrypt(text As String, k As Long) As String
    Dim cycle As Long, r As Long, i As Long, m As Long, rail As Long
    cycle = 2 * (k - 1)
    For r = 0 To k - 1
        For i = 0 To Len(text) - 1
            m = i Mod cycle
            If m < k Then rail = m Else rail = cycle - m
            If rail = r Then RailFenceEncrypt = RailFenceEncrypt & Mid$(text, i + 1, 1)
        Next i
    Next r
End Function

Sub Demo()
    Debug.Print RailFenceEncrypt("WEAREDISCOVERED", 3)
End Sub
