Dim childKeys() As String
Dim childValues() As Long
Dim wordEnd() As Boolean
Dim nodeCount As Long

Sub TrieInit()
    ReDim childKeys(1 To 1000)
    ReDim childValues(1 To 1000)
    ReDim wordEnd(1 To 1000)
    nodeCount = 1 ' node 1 is the root
End Sub

Function FindOrAddChild(node As Long, ch As String) As Long
    Dim key As String
    key = node & "|" & ch
    Dim i As Long
    For i = 1 To nodeCount
        If childKeys(i) = key Then
            FindOrAddChild = childValues(i)
            Exit Function
        End If
    Next i

    nodeCount = nodeCount + 1
    childKeys(nodeCount) = key
    childValues(nodeCount) = nodeCount
    FindOrAddChild = nodeCount
End Function

Sub TrieInsert(word As String)
    Dim node As Long
    node = 1
    Dim i As Long
    For i = 1 To Len(word)
        node = FindOrAddChild(node, Mid(word, i, 1))
    Next i
    wordEnd(node) = True
End Sub

Function TrieContains(word As String) As Boolean
    Dim node As Long
    node = 1
    Dim i As Long
    Dim key As String
    Dim found As Boolean

    For i = 1 To Len(word)
        key = node & "|" & Mid(word, i, 1)
        found = False
        Dim j As Long
        For j = 1 To nodeCount
            If childKeys(j) = key Then
                node = childValues(j)
                found = True
                Exit For
            End If
        Next j
        If Not found Then
            TrieContains = False
            Exit Function
        End If
    Next i

    TrieContains = wordEnd(node)
End Function

Sub Main()
    TrieInit
    TrieInsert "cat"
    TrieInsert "car"
    TrieInsert "dog"

    Debug.Print TrieContains("cat")
    Debug.Print TrieContains("ca")
    Debug.Print TrieContains("dog")
End Sub
