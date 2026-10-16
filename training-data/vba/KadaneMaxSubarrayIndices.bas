Function KadaneRange(arr() As Long, ByRef startIdx As Long, ByRef endIdx As Long) As Long
    Dim i As Long, cur As Long, best As Long, tempStart As Long
    cur = arr(LBound(arr)): best = cur
    tempStart = LBound(arr): startIdx = tempStart: endIdx = tempStart
    For i = LBound(arr) + 1 To UBound(arr)
        If cur < 0 Then
            cur = arr(i)
            tempStart = i
        Else
            cur = cur + arr(i)
        End If
        If cur > best Then
            best = cur
            startIdx = tempStart
            endIdx = i
        End If
    Next i
    KadaneRange = best
End Function

Sub Main()
    Dim data(8) As Long
    data(0) = -2: data(1) = 1: data(2) = -3: data(3) = 4: data(4) = -1
    data(5) = 2: data(6) = 1: data(7) = -5: data(8) = 4
    Dim s As Long, e As Long
    Debug.Print "Max sum: " & KadaneRange(data, s, e) & " from " & s & " to " & e
End Sub
