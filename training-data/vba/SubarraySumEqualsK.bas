' Count contiguous subarrays whose sum equals k (prefix sums + Scripting.Dictionary).
Public Function CountSubarrays(nums As Variant, ByVal k As Long) As Long
    Dim seen As Object, x As Variant
    Dim total As Long, result As Long
    Set seen = CreateObject("Scripting.Dictionary")
    seen.Add 0, 1
    For Each x In nums
        total = total + x
        If seen.Exists(total - k) Then result = result + seen(total - k)
        If seen.Exists(total) Then
            seen(total) = seen(total) + 1
        Else
            seen.Add total, 1
        End If
    Next x
    CountSubarrays = result
End Function

Public Sub RunSubarray()
    Debug.Print CountSubarrays(Array(1, 1, 1), 2)
End Sub
