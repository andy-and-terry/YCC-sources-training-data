Public Function FourSumCount(a As Variant, b As Variant, c As Variant, d As Variant) As Long
    Dim sums As Object, x As Variant, y As Variant, k As Long
    Set sums = CreateObject("Scripting.Dictionary")
    For Each x In a
        For Each y In b
            k = x + y
            sums(k) = sums(k) + 1
        Next y
    Next x
    For Each x In c
        For Each y In d
            k = -(x + y)
            If sums.Exists(k) Then FourSumCount = FourSumCount + sums(k)
        Next y
    Next x
End Function

Public Sub DemoFourSum()
    Debug.Print FourSumCount(Array(1, 2), Array(-2, -1), Array(-1, 2), Array(0, 2)) ' 2
End Sub
