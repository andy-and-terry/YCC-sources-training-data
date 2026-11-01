' Greedy sequence whose pairwise sums are all distinct.
Sub PrintMianChowla()
    Dim seq(1 To 8) As Long
    Dim used As Object, fresh As Object
    Dim n As Long, cand As Long, i As Long, s As Long
    Dim ok As Boolean, k As Variant, out As String
    Set used = CreateObject("Scripting.Dictionary")
    cand = 1
    Do While n < 8
        Set fresh = CreateObject("Scripting.Dictionary")
        ok = True
        seq(n + 1) = cand
        For i = 1 To n + 1
            s = seq(i) + cand
            If used.Exists(s) Or fresh.Exists(s) Then
                ok = False
            Else
                fresh.Add s, True
            End If
        Next i
        If ok Then
            For Each k In fresh.Keys
                used(k) = True
            Next k
            n = n + 1
        End If
        cand = cand + 1
    Loop
    For i = 1 To 8
        out = out & seq(i) & " "
    Next i
    Debug.Print Trim(out)
End Sub
