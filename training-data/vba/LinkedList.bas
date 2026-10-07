Dim nodeValue(100) As Long
Dim nodeNext(100) As Long
Dim headIdx As Long
Dim nodeCount As Long

Sub ListInit()
    headIdx = -1
    nodeCount = 0
End Sub

Sub ListInsertHead(value As Long)
    nodeValue(nodeCount) = value
    nodeNext(nodeCount) = headIdx
    headIdx = nodeCount
    nodeCount = nodeCount + 1
End Sub

Sub ListPrint()
    Dim cur As Long
    cur = headIdx
    Do While cur <> -1
        Debug.Print nodeValue(cur)
        cur = nodeNext(cur)
    Loop
End Sub

Sub Main()
    ListInit
    ListInsertHead 3
    ListInsertHead 2
    ListInsertHead 1
    ListPrint
End Sub
