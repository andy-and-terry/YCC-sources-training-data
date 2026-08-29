Dim bufData(2) As Long
Dim bufSize As Long
Dim bufStart As Long
Const bufCapacity As Long = 3

Sub PushBuffer(value As Long)
    Dim index As Long
    index = (bufStart + bufSize) Mod bufCapacity
    bufData(index) = value
    If bufSize < bufCapacity Then
        bufSize = bufSize + 1
    Else
        bufStart = (bufStart + 1) Mod bufCapacity
    End If
End Sub

Sub Main()
    Dim values(4) As Long
    values(0) = 1: values(1) = 2: values(2) = 3: values(3) = 4: values(4) = 5
    Dim i As Long
    For i = 0 To 4
        PushBuffer values(i)
    Next i
    For i = 0 To bufCapacity - 1
        Debug.Print bufData(i)
    Next i
End Sub
