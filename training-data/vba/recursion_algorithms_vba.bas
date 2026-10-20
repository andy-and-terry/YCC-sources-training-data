Function Fact(n As Long) As Double
    If n <= 1 Then Fact = 1 Else Fact = n * Fact(n - 1)
End Function

Function Fib(n As Long) As Long
    If n < 2 Then Fib = n Else Fib = Fib(n - 1) + Fib(n - 2)
End Function

Function Gcd(a As Long, b As Long) As Long
    If b = 0 Then Gcd = a Else Gcd = Gcd(b, a Mod b)
End Function

Function BinarySearch(arr() As Long, target As Long) As Long
    Dim lo As Long, hi As Long, mid As Long
    lo = LBound(arr): hi = UBound(arr): BinarySearch = -1
    Do While lo <= hi
        mid = (lo + hi) \ 2
        If arr(mid) = target Then BinarySearch = mid: Exit Function
        If arr(mid) < target Then lo = mid + 1 Else hi = mid - 1
    Loop
End Function

Function IsPrime(n As Long) As Boolean
    Dim d As Long
    If n < 2 Then Exit Function
    For d = 2 To Int(Sqr(n))
        If n Mod d = 0 Then Exit Function
    Next d
    IsPrime = True
End Function

Sub RunAlgorithms()
    Dim a(0 To 4) As Long: a(0) = 1: a(1) = 3: a(2) = 5: a(3) = 7: a(4) = 9
    Debug.Print Fact(10), Fib(15), Gcd(48, 18), BinarySearch(a, 7), IsPrime(97)
End Sub
