Function RunLengthEncode(s As String) As String
    Dim result As String
    Dim i As Long, n As Long, runCount As Long
    n = Len(s)
    i = 1
    result = ""
    Do While i <= n
        runCount = 1
        Do While i + runCount <= n And Mid(s, i, 1) = Mid(s, i + runCount, 1)
            runCount = runCount + 1
        Loop
        result = result & Mid(s, i, 1) & CStr(runCount)
        i = i + runCount
    Loop
    RunLengthEncode = result
End Function

Function RunLengthDecode(s As String) As String
    Dim result As String
    Dim i As Long, n As Long
    Dim ch As String, numStr As String
    n = Len(s)
    i = 1
    result = ""
    Do While i <= n
        ch = Mid(s, i, 1)
        i = i + 1
        numStr = ""
        Do While i <= n And Mid(s, i, 1) >= "0" And Mid(s, i, 1) <= "9"
            numStr = numStr & Mid(s, i, 1)
            i = i + 1
        Loop
        result = result & String(CLng(numStr), ch)
    Loop
    RunLengthDecode = result
End Function

Sub Main()
    Dim encoded As String
    encoded = RunLengthEncode("aaabbbcccd")
    Debug.Print encoded
    Debug.Print RunLengthDecode(encoded)
End Sub
