Function WindowMax(values() As Long, k As Long) As String
    Dim n As Long
    n = UBound(values) - LBound(values) + 1

    Dim deque() As Long
    ReDim deque(n - 1)
    Dim dqHead As Long, dqTail As Long
    dqHead = 0: dqTail = -1

    Dim result As String
    Dim i As Long

    For i = 0 To n - 1
        Do While dqTail >= dqHead And values(deque(dqTail)) <= values(i)
            dqTail = dqTail - 1
        Loop
        dqTail = dqTail + 1
        deque(dqTail) = i

        If deque(dqHead) <= i - k Then
            dqHead = dqHead + 1
        End If

        If i >= k - 1 Then
            If Len(result) > 0 Then result = result & " "
            result = result & CStr(values(deque(dqHead)))
        End If
    Next i

    WindowMax = result
End Function

Sub Main()
    Dim data(7) As Long
    data(0) = 1: data(1) = 3: data(2) = -1: data(3) = -3
    data(4) = 5: data(5) = 3: data(6) = 6: data(7) = 7

    Debug.Print WindowMax(data, 3)
End Sub
