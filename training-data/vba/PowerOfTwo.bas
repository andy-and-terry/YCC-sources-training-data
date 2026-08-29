Function IsPowerOfTwo(n As Long) As Boolean
    IsPowerOfTwo = (n > 0) And ((n And (n - 1)) = 0)
End Function

Sub Main()
    Debug.Print IsPowerOfTwo(16)
    Debug.Print IsPowerOfTwo(18)
End Sub
