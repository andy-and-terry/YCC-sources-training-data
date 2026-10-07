Sub Main()
    Dim fruits As Variant
    fruits = Array("apple", "banana", "cherry", "avocado")

    Debug.Print LBound(fruits); UBound(fruits)

    Dim onlyA As Variant
    onlyA = Filter(fruits, "a", True)
    Debug.Print UBound(onlyA) + 1; "items contain 'a'"

    Dim noBan As Variant
    noBan = Filter(fruits, "banana", False)
    Debug.Print Join(noBan, ", ")

    Dim parts() As String
    parts = Split("one two three", " ")
    Debug.Print parts(1), UBound(parts)

    Debug.Print IsArray(fruits), IsArray("text")
    Erase parts
End Sub
